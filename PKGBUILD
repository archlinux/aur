# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>

pkgname=unlock-pacman
pkgver=0.2.1
pkgrel=0
pkgdesc="A sd-service to remove the pacman lock on shutdown"
arch=('x86_64')
url="https://gitlab.com/Fabish/unlock-pacman"
license=('Apache')
depends=('systemd' 'pacman')
makedepends=('')
install="${pkgname}.install"
source=("https://gitlab.com/Fabish/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=('c09b556936568a34718025df11b3cde2f373d13be0af6f4e5b5e1e8fb6f6a3208ba2e4ebb6a9c3c71bd54df9dcd95d7398a0d5d3b03d31e4ad2d6d494f9d0f66')


package() {
	# CONTENT
	# sd-service and script
	cd "${srcdir}"
	/usr/bin/install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" \
	"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	/usr/bin/install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" \
	"${pkgdir}/usr/lib/systemd/scripts/${pkgname}.sh"

	
	# COPYRIGHT FILE
	## move the copyright text
	/usr/bin/install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
