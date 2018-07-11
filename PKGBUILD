## Package Maintainer: wchurch58

pkgname=virtualshield-systemd
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/$pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('806f5ba2387ef58d22aad8137abc641b87a7d3adeaea2fa3579432043d8d47c05c8b324ea05c77cff69aaf79c20683cd1df492bdde89e4b7ad30bd8023aa38f2')

## SystemD

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "virtualshield.service" "${pkgdir}/etc/systemd/system/virtualshield.service"
	install -D -m755 "virtualshield-start" "${pkgdir}/usr/bin/virtualshield-start"
	install -D -m755 "virtualshield-stop" "${pkgdir}/usr/bin/virtualshield-stop"

}
