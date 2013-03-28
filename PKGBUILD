# $Id: PKGBUILD 166522 2012-09-09 15:41:10Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-vpnc-gtk2
pkgver=0.9.6.0
pkgrel=1
pkgdesc="NetworkManager VPN plugin for vpnc"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'vpnc' 'hicolor-icon-theme' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=('networkmanager-vpnc')
conflicts=('networkmanager-vpnc')
install=networkmanager-vpnc.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-vpnc/0.9/NetworkManager-vpnc-${pkgver}.tar.xz)
sha256sums=('6c8e35862330e17ee8f4dc44b1ac47470da703e436d339c7b3e2dac7d1b148a2')

build() {
  cd NetworkManager-vpnc-${pkgver}
  ./configure \
	--prefix=/usr \
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
