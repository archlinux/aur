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
sha512sums=('6e553d5ce3a86094f725ab3389fccc90ae6f1feaedaa587202c06a4535fbeec9d4d52a27e3055008d1af1895babd1e0f3ec2715f8edb5ffef42117838ae8cf33')

## SystemD

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "virtualshield.service" "${pkgdir}/etc/systemd/system/virtualshield.service"
	install -D -m755 "virtualshield-start" "${pkgdir}/usr/bin/virtualshield-start"
	install -D -m755 "virtualshield-stop" "${pkgdir}/usr/bin/virtualshield-stop"

}
