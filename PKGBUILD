# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=libelfin-git
pkgver=r148.ac45a09
pkgrel=2
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
