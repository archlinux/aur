#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.0.1
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core' 'libgcrypt' 'glib2')
makedepends=('intltool' 'pkgconfig')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('9d748842dab86914488bef039ca2c25f8ff5510daae3815643e6e00a2f69cacb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
