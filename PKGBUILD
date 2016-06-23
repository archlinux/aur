pkgname=ravi
pkgver=0.15.1
pkgrel=1
pkgdesc='a derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
depends=()
makedepends=(cmake llvm)
source=(ravi-$pkgver.zip::https://github.com/dibyendumajumdar/ravi/archive/$pkgver.zip)
sha1sums=('cb631180e1cc68a984b2f81da6e606a5e13047bc')

build() {
  cd ravi-$pkgver
  cmake -DLLVM_JIT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . 
  make 
}

check() {
  cd ravi-$pkgver
  make test
}

package() {
  cd ravi-$pkgver
  make DESTDIR="$pkgdir" install 
}
