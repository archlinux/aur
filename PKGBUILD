# Contributor: Henning Garus <henning.garus@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=xtraceroute
pkgver=0.9.1
pkgrel=5
pkgdesc="gtk version of traceroute using opengl to show a globe with lines for routes"
arch=("i686" "x86_64")
url="http://www.archive.org/details/tucows_31913_Xtraceroute"
license=('GPL')
depends=(gtkglarea gdk-pixbuf dnsutils traceroute gtkglarea1)
source=(http://www.archive.org/download/tucows_31913_Xtraceroute/${pkgname}-${pkgver}.tar.gz)
md5sums=('ac212fed3ac9dc06851e5ffbe95901c0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed -i '205s%$%\\%' intl/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
