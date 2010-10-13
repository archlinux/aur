# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.1.6
pkgrel=1
pkgdesc="Telepathy framework logging daemon"
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib>=0.12' 'sqlite3' 'libxml2>=2.7.7' 'dconf')
makedepends=('intltool' 'gnome-doc-utils')
options=('!libtool')
source=(http://telepathy.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('46455026b18f12a56a4253e3b85d02a3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/telepathy \
    --disable-static \
    --disable-scrollkeeper \
    --disable-schemas-compile

  make
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
