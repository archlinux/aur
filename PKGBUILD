# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libelfin-git
pkgver=r147.4a678c7
pkgrel=1
pkgdesc="C++11 ELF/DWARF parser"
arch=(x86_64)
url="https://github.com/aclements/libelfin"
license=(MIT)
depends=(glibc)
makedepends=(git)
source=("$pkgname::git+https://github.com/aclements/libelfin")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  make PREFIX="$pkgdir/usr" install
}
