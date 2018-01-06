# Maintainer: Raphael Michel <mail@raphaelmichel.de>
_pkgname=pretixdesk
pkgname=$_pkgname
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop application for attendee check-in with the pretix ticketing system"
arch=('x86_64')
license=('GPL')
url="https://pretix.eu"
depends=('jdk>=9' 'bash' 'sqlite')
makedepends=('jdk>=9' 'gradle')
source=("https://download.pretix.eu/public/pretixdesk/jar/pretixdesk-${pkgver}.jar" 'launcher' 'pretixdesk.desktop')
conflicts=('pretixdesk-git')
provides=('pretixdesk')
sha256sums=('66690cef8cc6494d10a10d9c9e772481fb7307de93e74645276e01290fceccb8' 'SKIP' 'SKIP')

package() {
	install -d "${pkgdir}/usr/bin"
	install -Dm 755 launcher "${pkgdir}/usr/bin/pretixdesk"
	install -Dm 644 pretixdesk.desktop "${pkgdir}/usr/share/applications/pretixdesk.desktop"
	install -Dm 644 pretixdesk-${pkgver}.jar "${pkgdir}/usr/share/java/${_pkgname}/pretixdesk.jar"
}
