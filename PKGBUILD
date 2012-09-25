# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.6.0
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server' 'nautilus' 'dconf')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool' 'gupnp')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5f90a1a7b054257545dc72fa3a63de8f5564815576f90a21c320ebb177b9268e')

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
