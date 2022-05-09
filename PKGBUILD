# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'discord' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gnome-keyring' 'gtk3' 'kwalletmanager' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager>=1.20.0' 'networkmanager-openvpn' 'nspr' 'nss' 'pango' 'wireguard-tools' 'zip')
optdepends=('fonts-noto-color-emoji' 'libappindicator-gtk3')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.0.6-631_amd64.deb")
sha512sums=('b421b10904d5bbb1dafb1119408f94258b64b6274d27852c150f342ea6885b29034b3f9b341991c1bf8f286c9572aaf8b616cbc33adc1f9cf4945b6f8e880202')
install=${pkgname}.install

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
