# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-easydev
_pkgname=${pkgname#python2-}
pkgver=0.9.38
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python2-sphinx')
url="https://pypi.python.org/pypi/$_pkgname"
source=($pkgname.tar.gz::https://github.com/cokelaer/easydev/archive/$pkgver.tar.gz)
sha256sums=('4e817d1bea2197b1bc8b147ac8888bbec084f74ad0b5be8bc4750df5f44a90b5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
