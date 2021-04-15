pkgname=libspeedhack-git
pkgver=r12.29e0bd6
pkgrel=1
pkgdesc="A simple dynamic library to slowdown or speedup games on Linux"
arch=('x86_64')
url="https://github.com/evg-zhabotinsky/libspeedhack"
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/evg-zhabotinsky/libspeedhack.git")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "$srcdir/$pkgname"
  make
  mkdir -p "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/lib"
  install speedhack "$pkgdir/usr/bin"
  cd lib
  install libspeedhack.so "$pkgdir/usr/lib"
}
