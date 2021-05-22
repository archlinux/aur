# Maintainer: Evandro Begati <evandroalb at gmail dot com>
# Check for new Linux releases in: https://calimaerp.com/app
# Generate version: makepkg --printsrcinfo > .SRCINFO

pkgname=calima-app
pkgver=2.0.9
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
sha512sums=('abb08725830ddfd2dc1ef1a312d467729e85d3443791451a8aa5da600bfa2dbdb6ca93ce38c705d93e343f690ba7fee428816856d762760106fac3b4829a7b77')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C ${pkgdir}
}
