# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.6
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
options=('!strip' '!emptydirs')
source_x86_64=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums_x86_64=('390d78fbefb711081fa46109d3c62be4fea77f36aa515ec3c1a4c365faa91aaf11271ef5ec8fcdad63df2ddc8146d5bd14fab18304d6eb1786f328df0942b401')

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
