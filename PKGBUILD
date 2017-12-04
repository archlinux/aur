# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=3.0.0
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("afa466ef702d42fcbb675fa8af6b72e99289eaf77994df995aeee43af23aacfa2831c9a6dfcfaa16fca260d423beee49f5818f8c703cc515952b1bc20f4c1fe9")

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
