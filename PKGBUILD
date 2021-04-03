# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=ms-edge
pkgver=91.0.838.3
pkgrel=1
epoch=
pkgdesc="Microsoft Edge for arch"
arch=('x86_64')
url="https://www.microsoftedgeinsider.com/en-us/download/?platform=linux"
license=('All rights reserved')
groups=()
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa')
makedepends=()
checkdepends=()
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland'
            'kdialog: for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'gtk3: for printing'
            'libunity: for download progress on KDE'
            'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
            'xdg-utils')
provides=(ms-edge)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/liberationfonts/liberation-fonts/files/6060976/liberation-fonts-ttf-2.1.3.tar.gz" "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_$pkgver-1_amd64.deb")
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=()

package() {
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/share/
	mkdir $pkgdir/usr/share/fonts/
	mkdir $pkgdir/usr/share/fonts/TTF/
	mv $srcdir/libe*/*.ttf $pkgdir/usr/share/fonts/TTF/.
	mkdir $srcdir/pac
	cd $srcdir/pac
	tar xpvf ../data.tar.*
	cp -r * $pkgdir/
}
