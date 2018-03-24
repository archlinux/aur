# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=flashplayer-projector
pkgver=29.0.0.113
pkgrel=1
pkgdesc="Standalone (a.k.a. projector) version of Adobe's Flash Player"
arch=('x86_64')
url='http://www.adobe.com/support/flashplayer/debug_downloads.html'
license=('LGPL' 'custom:Adobe')
depends=('gtk2' 'nss' 'libgl')
makedepends=('gendesk')
source=("https://fpdownload.macromedia.com/pub/flashplayer/updaters/${pkgver%%.*}/flash_player_sa_linux.x86_64.tar.gz")
sha256sums=('888cc3d18131d197daa6a70ef43fd7bdf49612875f884c7035bae03502d7bc9f')

prepare() {
	gendesk -f -n \
		--pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--name "Adobe Flash Player Projector" \
		--genericname "Flash Player" \
		--comment "Player for using content created on the Adobe Flash platform." \
		--exec "/usr/bin/flashplayer" \
		--categories "AudioVideo;Audio;Video;Graphics;Viewer;Player;GTK" \
		--mimetypes "application/x-shockwave-flash;image/gif;image/jpg;image/png;"
}

package() {
	install -Dm644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
	install -Dm755 flashplayer "${pkgdir}/usr/bin/flashplayer"
	install -Dm644 flashplayer.desktop "${pkgdir}/usr/share/applications/flashplayer.desktop"
}
