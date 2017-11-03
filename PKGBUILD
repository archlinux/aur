#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=gnome-mud
pkgver=0.11.2
pkgrel=3
pkgdesc="GnomeMud is an advanced MUD client for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/GnomeMud"
license=('GPL')
makedepends=('intltool')
depends=('gnet' 'libglade' 'vte')
provides=('gnome-mud')
source=("https://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
md5sums=('aa41b2afb55158e7a9d2e14831223949')

build() {
  cd "$pkgname-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

