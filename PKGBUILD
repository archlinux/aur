# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=3.0.3
pkgrel=2
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("8b7afad6756661d0a08589552a261b6b00185a3a6124081a2f62dc322c41c2b09b6a41fe4972638ac4032290cd679cd08db6c7a88a00b8394d815cfa9e3642ed")

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
