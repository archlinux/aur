# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.8.1
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
sha256sums=('a802a05edb46a759be6d0f1ca5a945c61860f4959a84f2ac1596c1146580aa90')

build() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
