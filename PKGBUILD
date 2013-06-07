# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=0.9.8.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'openvpn' 'gtk3' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.9/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('d1c032f30e3c58d6d6bc371aad6d7e757f748d23a9240c077294492753078359')

build() {
  cd NetworkManager-openvpn-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static
  make
}

package() {
  cd NetworkManager-openvpn-${pkgver}
  make DESTDIR="${pkgdir}" install
}
