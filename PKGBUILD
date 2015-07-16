# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.219.50
pkgrel=2
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64' 'i686')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
source_i686=("https://vivaldi.com/download/vivaldi_TP4.${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/vivaldi_TP4.${pkgver}-1.x86_64.rpm")
sha256sums_x86_64=('65349f39479690806df09b5dfb7deda3bba084ac4c8758825e2a264f13a9004b')
sha256sums_i686=('a2a6614b160c7bd6178273b61e64c6116f581e30c587088207694ddb8daa8209')

package() {
    cp -a {opt,usr} "$pkgdir"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done
}

