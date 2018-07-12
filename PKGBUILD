# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=python2-lnt-git
pkgver=r1796.1384b08
pkgrel=1
pkgdesc="LLVM nightly test infrastructure"
arch=('x86_64')
depends=(python2 python2-pip python2-llvm-lit)
source=('git+https://github.com/llvm-mirror/lnt.git')
md5sums=('SKIP')

pkgver() {
  cd "lnt"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "lnt"
  python2 setup.py build
}

package() {
  cd "lnt"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
