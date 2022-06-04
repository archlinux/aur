pkgname=mingw-w64-wclang
pkgver=r98.568d8c1
pkgrel=1
pkgdesc="MinGW clang wrapper (mingw-w64)"
url="https://github.com/tpoechtrager/wclang"
arch=('x86_64')
license=(GPL)
depends=('mingw-w64-gcc' 'clang')
makedepends=('cmake' 'git')
source=("git+https://github.com/tpoechtrager/wclang.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wclang"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/wclang"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/wclang"
  make DESTDIR="${pkgdir}" install
}

