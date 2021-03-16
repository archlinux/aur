_repo="znc-playback"
pkgname=${_repo}-git
pkgver=r73.8dd128b
pkgrel=1
pkgdesc="An advanced playback module for ZNC"
arch=('i686' 'x86_64')
url="https://github.com/jpnurmi/znc-playback"
license=('Apache')
depends=('znc')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/jpnurmi/znc-playback.git")

pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_repo"
  znc-buildmod playback.cpp
}

package() {
  cd "$_repo"
  install -Dm755 playback.so "$pkgdir/usr/lib/znc/playback.so"
}
sha256sums=('SKIP')
