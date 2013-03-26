# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.7.92
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection)
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('9dd08958497789bd5a5605aac7f1b9c2b39d5a54ae85393f3a318bc4cb1330d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
