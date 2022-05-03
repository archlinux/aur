# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.0.5
pkgrel=5
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gnome-keyring' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager>=1.20.0' 'networkmanager-openvpn' 'nspr' 'nss' 'pango' 'wireguard-tools' 'zip')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.0.5-547_amd64.deb")
sha512sums=('b4d030f73fc575d908e57c71db5c59ed2a3a138fa7a3e40d5643a50beef8048a981af3b16070d9f8a6dfeed1e32a34d09de10b6c0a0fc06beb1319dc64738522')
install=${pkgname}.install

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
