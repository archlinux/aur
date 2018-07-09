## Package Maintainer: Karl-K

pkgname=virtualshield-systemd
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/$pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1a7b3ecb9f77496bde1f921e8b142f0ddffe9a3adb3e73e870142cb64904138f337e2d54b7b967c3d2b723307c9be777d536c7f3de3afe63c745254e017b4728')

## SystemD

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "virtualshield.service" "${pkgdir}/etc/systemd/system/virtualshield.service"
	install -D -m755 "virtualshield-start" "${pkgdir}/usr/bin/virtualshield-start"
	install -D -m755 "virtualshield-stop" "${pkgdir}/usr/bin/virtualshield-stop"

}
