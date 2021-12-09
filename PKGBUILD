# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.8
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('libcurl-gnutls')
options=('!strip' '!emptydirs')
source_x86_64=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums_x86_64=('5f2d339d39c70f9097ada268e16e9d4f2a5471a319562299e13b14e1ed1c231f83bfada779baa2190c04fe87df4184cbaa496163fdcb5b9a5a7314d9de01057a')

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
