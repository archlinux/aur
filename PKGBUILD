# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.2.9
pkgrel=1
pkgdesc="Telepathy framework logging daemon"
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite3' 'libxml2' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'gobject-introspection')
options=('!libtool')
source=(http://telepathy.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6d4a1c916883e4d1f19ed1002be6700c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/telepathy \
    --disable-static \
    --disable-scrollkeeper \
    --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
