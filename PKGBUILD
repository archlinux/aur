# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Henning Garus <henning.garus@gmail.com>

pkgname=xtraceroute
pkgver=0.9.2
pkgrel=1
pkgdesc="gtk version of traceroute using opengl to show a globe with lines for routes"
arch=("i686" "x86_64")
url="http://www.archive.org/details/tucows_31913_Xtraceroute"
license=('GPL')
depends=(gtkglarea gdk-pixbuf dnsutils traceroute gtkglarea1)
source=("https://github.com/utopiabound/xtraceroute/archive/v${pkgver}.tar.gz")
md5sums=('03303cf9d46049d010e0059dc967fb2f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  LDFLAGS='-lGLU' ./configure --prefix=/usr --mandir=/usr/share/man --datadir=/usr/share
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
