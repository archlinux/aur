#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.3.91
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core' 'glib2' 'libgcrypt')
makedepends=('intltool' 'gobject-introspection')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a6b89766642e4835b916873d5784597476cd06a81b0c69f87ed8b7b55fd806fa')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
