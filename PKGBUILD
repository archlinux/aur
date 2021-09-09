# Maintainer: Evandro Begati <evandroalb at gmail dot com>
# Check for new Linux releases in: https://calimaerp.com/app
# Generate version: makepkg --printsrcinfo > .SRCINFO

pkgname=calima-app
pkgbase=calima-app-aur
pkgver=2.0.12
pkgrel=1
pkgdesc="Access application for Calima ERP Contábil."
arch=('x86_64')
url="https://www.calimaerp.com"
license=('custom:calima-app')
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
optdepends=(
	'libpipewire02: WebRTC desktop sharing under Wayland'
	'kdialog: for file dialogs in KDE'
	'gnome-keyring: for storing passwords in GNOME keyring'
	'kwallet: for storing passwords in KWallet'
	'libunity: for download progress on KDE'
	'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
	'xdg-utils'
)
options=('!emptydirs' '!strip')
source=("https://objectstorage.sa-saopaulo-1.oraclecloud.com/n/id3qvymhlwic/b/downloads/o/calima-app/calima-app-${pkgver}.deb")
sha512sums=('c226b9d4ba26f314c8eac5ffab2038a817d766be6f7b0f2cf637b461a8f4a6194eb26c3a2a15fe61c86b459078cc629212a8ef3e354a8f75d2e79019f8233380')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C ${pkgdir}
}
