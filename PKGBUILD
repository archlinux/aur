# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.8.3
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-pyserial')
makedepends=('python-setuptools')
provides=('rnodeconf')
conflicts=('rnodeconf')
url="https://reticulum.network/"
license=('MIT')
source=($pkgname-$pkgver::https://github.com/markqvist/Reticulum/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('02b4d29b9a7ca5a8cd8d710cdc5c6f1bcd26217d8397cc236f233d0c7776d07d')

build() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
