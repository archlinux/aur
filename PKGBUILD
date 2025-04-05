# Maintainer: Bet4 <0xbet4@gmail.com>

_pkgname=udbserver
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="Python bindings for udbserver"
arch=(x86_64)
url="https://github.com/bet4it/udbserver"
license=(MIT)
depends=(python-unicorn)
makedepends=(python-setuptools-rust)
source=("https://github.com/bet4it/udbserver/archive/v${pkgver}.tar.gz")
sha256sums=('b9f299120d07c9a45299205b8f25dd552a7267bbffb067c8d2c66c5913a7b327')

build() {
  cd "$srcdir/$_pkgname-$pkgver/bindings/python"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/bindings/python"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
