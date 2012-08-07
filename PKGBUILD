# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=0.9.6.0
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
sha256sums=('8fb88705793399574b3de2af93f87b63c0eae342d549a1c79bc59f6a1fad87a3')

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
