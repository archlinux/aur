#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.32.0
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core>=1.4.0' 'libgcrypt>=1.4.6' 'glib2>=2.26.0')
makedepends=('intltool' 'pkgconfig' 'python2' 'gtk-doc')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.32/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
  make -j1 DESTDIR="${pkgdir}" install
}
