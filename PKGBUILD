# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.7
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
options=('!strip' '!emptydirs')
source_x86_64=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums_x86_64=('c5429cb519e8a4971ed7550fcd8b998d08353e1c4038a57c694d9dfe2de534fe6a28de3c155ac11541a8914bf0315b7bfa4274e2f69e9ebc2caf7b08595047d1')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${srcdir}"
    cd "${srcdir}"
    
    install -Dm0755 usr/bin/helio "$pkgdir"/usr/bin/helio
    install -Dm0755 usr/share/applications/Helio.desktop "$pkgdir"/usr/share/applications/helio.desktop
	for i in 16x16 32x32 48x48 128x128 256x256; do
		install -Dm644 usr/share/icons/hicolor/"$i"/apps/helio-workstation.png \
            "$pkgdir"/usr/share/icons/hicolor/"$i"/apps/helio-workstation.png
	done
}
