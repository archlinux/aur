# Maintainer: Evandro Begati <evandroalb at gmail dot com>
# Check for new Linux releases in: https://calimaerp.com/app
# Generate version: makepkg --printsrcinfo > .SRCINFO

pkgname=calima-app
pkgbase=calima-app-aur
pkgver=2.0.10
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
sha512sums=('a27a1f238d7bebbfcd09a0b7edaf4e71b649e91207140d08a51949b56b4b8d0d271c0e85136ca18c9de83e69e39876489f3c7ab11e76e8755ebc817aac31fdf0')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C ${pkgdir}
}
