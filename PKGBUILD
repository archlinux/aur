# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-iso639
_libname=iso639
pkgver=0.4.5
pkgrel=5
pkgdesc="Python library for ISO 639 standard"
arch=('any')
url="https://github.com/noumar/iso639"
license=('AGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$_libname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e68347887a438a0c49e6fe053206bf5d40348c4624f5ccffadc8bed2fa5e8ac9')

build() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
