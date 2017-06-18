# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=2.1.1
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("1c3fa63318d4395b7ab85d3a3c87ba34d1f3dab9d3854af4984074e14673c3b82d39a4d632ac46d1f36c136b835b05797a96a4f801f4b87f607ed1c5122c4af7")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "${pkgdir}/usr/share/GoodTests.py"
  install -m 755 distrib/runTests.py "${pkgdir}/usr/share/GoodTests.py"
}
