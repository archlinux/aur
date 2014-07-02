# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.8.0
pkgrel=2
pkgdesc="Telepathy framework logging daemon"
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite' 'libxml2' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'gobject-introspection')
install=telepathy-logger.install
source=(http://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('e513eaa767344821073a0b7bb8b45217')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/telepathy \
    --enable-call \
    --disable-static \
    --disable-scrollkeeper \
    --disable-schemas-compile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
