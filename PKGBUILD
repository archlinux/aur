# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=goodtests
_realName=GoodTests
pkgver=2.2.0
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("1698d96cb2807a344540216057b3a6e76aa06ce8622f2d72dd06229740678dad364b0ab579fb2cc7ed96ba1670aa0c5dc0d6e51bf494ecff77cd3f37183171d9")

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
