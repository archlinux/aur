# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.2
pkgrel=2
pkgdesc="GNOME CSS2 parsing and manipulation toolkit"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool' 'pkgconfig')
license=('LGPL')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2")
url="http://www.gnome.org"
md5sums=('1429c597aa4b75fc610ab3a542c99209')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
