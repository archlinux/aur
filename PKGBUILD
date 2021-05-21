# Maintainer: Evandro Begati <evandroalb at gmail dot com>
# Check for new Linux releases in: https://calimaerp.com/app
# Generate version: makepkg --printsrcinfo > .SRCINFO

pkgname=calima-app
pkgver=2.0.8
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
sha512sums=('c42184b78312d98b33bbc968d5193463679787f601da79d4cf6b9ac1843600068812113a60627c150a203ef0845c3a07df156a7d070e9506420122668221bd20')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C ${pkgdir}
}
