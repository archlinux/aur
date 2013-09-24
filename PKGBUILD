# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.1
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection)
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('03fa46bff271acdbdedab6243b2a84e5ed3daa19c81b69d087b3e852c8fe5dab')

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
