# $Id: PKGBUILD 187899 2013-06-07 21:38:48Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-vpnc-gtk2
_pkgname=networkmanager-vpnc
pkgver=0.9.8.2
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
sha256sums=('adf6f4abd29d3f0384ef55fdfea75e6cd56088a0ecdfed2454305fd9e08318a1')

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
