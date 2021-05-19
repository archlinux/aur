pkgname=helio-workstation-bin
pkgver=3.5
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
options=('!strip' '!emptydirs')
source_x86_64=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums_x86_64=('dcce2b0050a7ddce01f9fc7ce44c81634a0090967595e0961a382282a36f9696ccb33c7d3ea94c81d5899247b98914906bac425be0ed21d265f5df298bb78c06')

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
