# Maintainer: Dan Ginovker <danielginovker@gmail.com>
# Contributor: Jae Beojkkoch <jae@jae.moe>

pkgname=openrsc-launcher-bin
pkgver=20211006.185500
pkgrel=1
pkgdesc="Authentic, Open Source Runescape Classic Game Launcher"
arch=('x86_64')
url="https://rsc.vet"
license=('GPL')
depends=('jre-openjdk')
source=("https://rsc.vet/downloads/OpenRSC.jar"
	"openrsc-launcher.desktop"
	"openrsc-launcher")
sha256sums=('a9f263b2616e2cb942cb224c2ce39daf9a2b8f3fdd2268db37030079c2e7cfbb'
            'a30273d914d91bee40935f9327a3c4f8223a6a433dccbf8e156f52856376af04'
            '51afc18c2c230da28c9af132960723e78f246483d02e6d38e28c828ca5597173')

package() {
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
