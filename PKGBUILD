# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmbattery
pkgver=2.50
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=wmbattery"
license=('GPL')
depends=('libxpm' 'upower')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=wmbattery-2.48.tar.gz")
md5sums=('SKIP')

build() {
  cd dockapps-*
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir/" install
}
