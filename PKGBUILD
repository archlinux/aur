# $Id: PKGBUILD 179572 2013-03-07 11:54:29Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-vpnc-gtk2
_pkgname=networkmanager-vpnc
pkgver=0.9.8.0
pkgrel=1
pkgdesc="NetworkManager VPN plugin for vpnc"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'vpnc' 'hicolor-icon-theme' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=networkmanager-vpnc.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-vpnc/0.9/NetworkManager-vpnc-${pkgver}.tar.xz)
sha256sums=('e4504c569315c20f2468995f073123a787cdb66695d321f20f994abd1d7eb1c1')

build() {
  cd NetworkManager-vpnc-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static \
	--with-gtkver=2 \
	--enable-more-warnings=no
  make
}

package() {
  cd NetworkManager-vpnc-${pkgver}
  make DESTDIR="${pkgdir}" install
}
