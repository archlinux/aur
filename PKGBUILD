# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager>=1.20.0' 'networkmanager-openvpn' 'nspr' 'nss' 'org.freedesktop.secrets' 'pango' 'wireguard-tools' 'zip')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.1.0-878_amd64.deb")
sha512sums=('33ad841e05be92e44ee30842afe3716f42a8334a0b60c6318de3239f34ec23ce801fd923384c05a90d190dddc38a0e2a07007b146e3d39cc8eddc137cf8a8072')
install=${pkgname}.install

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
