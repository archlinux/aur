# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.2.1
pkgrel=1
pkgdesc="Telepathy framework logging daemon"
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite3' 'libxml2' 'dconf')
makedepends=('intltool' 'gnome-doc-utils')
options=('!libtool')
source=(http://telepathy.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('eff40c64f5d300821121cfa80c0c6cf6')

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
