# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube-git
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
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
