# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=3.0.4
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("bd97181a2cc1bbbe153fe563969bc9fa6cd7b49441470207aeea3f47775c91df219e4a1a57ddfe1f9dd6c1c67d5873af4217626a21ad763bbfbeea8111c3872e")

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
