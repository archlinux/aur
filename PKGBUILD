# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.0.1
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server' 'nautilus' 'dconf')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('34617084b731db8bf3ffb517497d5645283f4aa7a9ebfa2a05da8c12066a0f14')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
