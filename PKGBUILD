# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.8.1
pkgrel=1
pkgdesc="Telepathy framework logging daemon"
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite' 'libxml2' 'dconf')
makedepends=('intltool' 'gobject-introspection')
install=telepathy-logger.install
source=(http://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('88f7dfde882d987b9c93b645efab2f43')

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
