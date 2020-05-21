# Maintainer: Jae Beojkkoch <jae@jae.moe>
pkgname=openrsc-launcher-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Launcher for the OpenRSC project."
arch=('x86_64')
url="https://orsc.dev"
license=('GPL')
depends=('jre-openjdk')
source=("http://game.openrsc.com/downloads/OpenRSC.jar"
	"openrsc-launcher.desktop"
	"openrsc-launcher")
sha256sums=('abc19ab4dd77de8115d0e6a4aec561cac5d082ecd315f5d34515d45e57121575'
            'd6ee03d5d62ceb11ef3bf9786148bcf1ce76015111785b56790f2ad073abf29f'
            '51afc18c2c230da28c9af132960723e78f246483d02e6d38e28c828ca5597173')

package(){
	cd "$srcdir"
	# Create executable folder
	mkdir -p "${pkgdir}/usr/share/java/openrsc-launcher/"
	chmod -R 755 "${pkgdir}/usr/share/java/openrsc-launcher/"
	# Script
	install -D -m755 "${srcdir}/openrsc-launcher" "${pkgdir}/usr/bin/openrsc-launcher"
	# Jar
	install -D -m644 "${srcdir}/OpenRSC.jar" "${pkgdir}/usr/share/java/openrsc-launcher/OpenRSC.jar"
	# Desktop entry
	install -D -m644 "${srcdir}/openrsc-launcher.desktop" "${pkgdir}/usr/share/applications/openrsc-launcher.desktop"
	
}
