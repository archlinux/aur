# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmbattery
pkgver=2.48
pkgrel=2
pkgdesc="Battery monitor dockapp for Window Maker"
arch=(i686 x86_64)
url="http://windowmaker.org/dockapps/?name=wmbattery"
license=('GPL')
depends=(libxpm upower)
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=wmbattery-2.48.tar.gz")
md5sums=('315e1546036674170ea2035e2f3604dc')

build() {
  cd "$srcdir/dockapps-"*
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/dockapps-"*
  make DESTDIR="$pkgdir/" install
}
