# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=python2-llvm-lit
pkgver=6.0.1
pkgrel=1
pkgdesc="LLVM integrated tester"
arch=('x86_64')
depends=(python2 python2-pip)
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz")
md5sums=('c88c98709300ce2c285391f387fecce0')

build() {
  cd "llvm-$pkgver.src/utils/lit"
  python2 setup.py build
}

package() {
  cd "llvm-$pkgver.src/utils/lit"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
