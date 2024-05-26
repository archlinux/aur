# Maintainer: develux <erroor234@gmail.com>
pkgname=topmem-cpp-git
pkgver=r41.83500b8
pkgrel=1
pkgdesc="It shows the top 10 processes using RAM and SWAP"
arch=('x86_64')
url="https://github.com/develux44/topmem-cpp"
license=('GPL-3.0-only')
makedepends=(gcc git)
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
