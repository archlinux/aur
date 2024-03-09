# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.7.3
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
sha256sums=('290ae367bcb5db80c2836267892765197cdc8736c50636dc7541c747356a2da0')

build() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
