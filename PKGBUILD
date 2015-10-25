# Maintainer: DeaDDooMER <deaddoomer@deadsoftware.ru>
pkgname=i3bar-icons
pkgver=4.11
pkgrel=1
pkgdesc="A version of i3bar which can display xbm icons"
url="https://github.com/ashinkarov/i3-extras"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libxcursor' 'xcb-util-keysyms' 'xcb-util-image' 'libev' 'yajl' 'pango' "i3-wm>=$pkgver")
makedepends=('pkgconfig')
conflicts=()
replaces=()
backup=()
install=i3bar-icons.install
source=("https://raw.githubusercontent.com/ashinkarov/i3-extras/master/i3bar-xbm-icons.patch"
	"http://i3wm.org/downloads/i3-$pkgver.tar.bz2")
md5sums=('SKIP'
	 '6b003955333a90cb831516f8dbf6e57d')
build() {
  cd i3-$pkgver
  patch -Np1 -i ../i3bar-xbm-icons.patch || return 1
  cd i3bar
  make
}

package() {
  cd i3-$pkgver/i3bar
  install -D -m755 i3bar $pkgdir/usr/bin/i3bar-icons
}
