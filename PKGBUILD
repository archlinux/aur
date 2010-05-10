# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=0.8.0.997
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager>=0.8.0.997' 'openvpn')
makedepends=('intltool' 'gtk2' 'libglade' 'gconf' 'libgnome-keyring')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.8/NetworkManager-openvpn-${pkgver}.tar.bz2)
sha256sums=('6315413df0ce5f2e92983a5ffb43ef92505a596a09dc6d661e896d48f2cf6fde')

build() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
