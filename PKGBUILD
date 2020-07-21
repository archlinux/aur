# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube-git
pkgver=git
pkgrel=1
pkgdesc="minimal tui youtube (invidious) frontend made in c++"
arch=('any')
license=('GPL3')
url="https://github.com/djt3/$pkgname/"
source=("git+https://gitlab.com/djt3/tuitube.git")
depends=('libcurlpp' 'mpv')
makedepends=('cmake')
md5sums=('SKIP')

build() {
  cd tuitube
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd tuitube
  make DESTDIR="$pkgdir/" install
}
