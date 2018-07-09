# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=3.0.2
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("4af71d12dd50fa3294e8c5b2fe1f3ae7cc292cb4a1fa1a4c40ab26dcff3f6fa2424d8e4468fb16e300dc577a25492d1163e7b8ebee5dac0e09023925b37fb64e")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "${pkgdir}/usr/share/GoodTests"
  install -m 755 distrib/runTests.py "${pkgdir}/usr/share/GoodTests/runTests.py"
}
