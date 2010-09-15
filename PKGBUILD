#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.31.92
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core>=1.4.0' 'libgcrypt>=1.4.6' 'glib2>=2.25.15')
makedepends=('intltool' 'pkgconfig' 'python' 'gtk-doc')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.31/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('f49ec4eb9efd2255eb45bbe3e71a132857d65f1c56d8f437c85371980da9c44a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
  make -j1 DESTDIR="${pkgdir}" install
}
