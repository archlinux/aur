# Maintainer: develux <erroor234@gmail.com>
pkgname=topmem-cpp-git
pkgver=r49.72f9311
pkgrel=1
pkgdesc="It shows the top N processes using RAM and SWAP"
arch=('x86_64')
url="https://github.com/develux44/topmem-cpp"
license=('GPL-3.0-only')
makedepends=(git)
conflicts=(topmem-cpp)
provides=("topmem-cpp=${pkgver}")
source=("git+https://github.com/develux44/topmem-cpp.git")
options=(strip !docs !debug lto)
sha256sums=('SKIP')

pkgver() {
  cd topmem-cpp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd topmem-cpp
  make
}

package() {
  cd topmem-cpp
  install -Dm755 topmem $pkgdir/usr/bin/topmem
}