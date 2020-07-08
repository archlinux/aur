# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube
pkgver=git
pkgrel=1
pkgdesc="minimal tui youtube (invidious) frontend made in c++"
arch=('any')
license=('GPL3')
url="https://github.com/djt3/$pkgname/"
source=("git+https://github.com/djt3/tuitube.git")
depends=('libcurlpp' 'mpv')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
