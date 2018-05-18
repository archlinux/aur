# Maintainer: Raphael Michel <mail@raphaelmichel.de>
_pkgname=pretixdesk
pkgname=$_pkgname
pkgver=0.3.3
pkgrel=1
pkgdesc="Desktop application for attendee check-in with the pretix ticketing system"
arch=('x86_64')
license=('GPL')
url="https://pretix.eu"
depends=('jre8-openjdk' 'java-openjfx' 'bash' 'sqlite')
makedepends=('jre8-openjdk' 'java-openjfx')
source=("https://download.pretix.eu/public/pretixdesk/jar/pretixdesk-${pkgver}.jar" 'launcher' 'pretixdesk.desktop')
conflicts=('pretixdesk-git')
provides=('pretixdesk')
sha256sums=('1b9c4b087aa318f20085ceab525ff794211619b752a23570434898f843be62c1' 'SKIP' 'SKIP')

package() {
	install -d "${pkgdir}/usr/bin"
	install -Dm 755 launcher "${pkgdir}/usr/bin/pretixdesk"
	install -Dm 644 pretixdesk.desktop "${pkgdir}/usr/share/applications/pretixdesk.desktop"
	install -Dm 644 pretixdesk-${pkgver}.jar "${pkgdir}/usr/share/java/${_pkgname}/pretixdesk.jar"
}
