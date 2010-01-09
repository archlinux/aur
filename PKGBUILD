# Maintainer: Ionut Biru <ionut@archlinux.ro>

pkgname=networkmanager-openvpn
pkgver=0.7.997
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager>=0.7.998' 'openvpn')
makedepends=('intltool' 'gtk2' 'libglade' 'gconf' 'gnome-keyring')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(ftp://ftp.archlinux.org/other/NetworkManager-openvpn/NetworkManager-openvpn-${pkgver}.tar.bz2)
#source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.7/NetworkManager-openvpn-${pkgver}.tar.bz2)
sha256sums=('08a25f0b7590cd227761c0a0157c83773fe7dfb7ca570464fa3e64b90143b3b2')

build() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
