# Maintainer: <djt3 {at} protonmail{dot}com>
pkgname=tuitube
pkgver=1.4.5
pkgrel=1
pkgdesc="minimal tui youtube (invidious) frontend made in c++"
arch=('any')
license=('GPL3')
url="https://github.com/djt3/$pkgname/"
source=("https://github.com/djt3/tuitube/archive/v$pkgver.tar.gz")
depends=('libcurlpp' 'mpv')
md5sums=('a42e2f808d619438f14cea4120070a2e')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
