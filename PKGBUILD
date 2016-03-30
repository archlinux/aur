# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.3
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection python2)
options=('!emptydirs')
install=nautilus-sendto.install
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('7ba1c37280e232b06d8e5097c584fab2e05f2b2eb2c5e9c7be8a765af063830c')

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
