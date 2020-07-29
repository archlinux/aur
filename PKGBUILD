# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube-git
pkgver=r138.d24cbc0
pkgrel=1
pkgdesc="minimal tui youtube (invidious) frontend made in c++"
arch=('any')
license=('GPL3')
url="https://github.com/djt3/tuitube/"
source=("git+https://gitlab.com/djt3/tuitube.git")
depends=('libcurlpp' 'mpv')
makedepends=('cmake' 'git')
md5sums=('SKIP')

pkgver() {
  cd "tuitube"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tuitube
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd tuitube
  make DESTDIR="$pkgdir/" install
}
