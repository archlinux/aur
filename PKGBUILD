# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube
pkgver=2.2.2
pkgrel=1
pkgdesc="minimal tui youtube (invidious) frontend made in c++"
arch=('any')
license=('GPL3')
url="https://github.com/djt3/$pkgname/"
source=("https://github.com/djt3/tuitube/archive/v$pkgver.tar.gz")
depends=('libcurlpp' 'mpv')
md5sums=('c81365f673fdf6ab71c8348e8506e247')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
