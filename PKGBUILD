# Maintainer: Zosoled <zosoled@codecow.xyz>
pkgname=nvs
pkgver=1.7.1
pkgrel=1
pkgdesc="A cross-platform tool for switching between versions and forks of Node.js"
arch=(any)
url="https://github.com/jasongin/nvs"
license=(MIT)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jasongin/nvs/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=("0df024c8c8489a63674cac148e766eab0cc2de3cd8e97c6caffd8e117a09863e"
            "SKIP")

package() {

	# install program files
	mkdir -p "${pkgdir}"/usr/share/${pkgname} && cp -r ${pkgname}-${pkgver}/* "${pkgdir}"/usr/share/${pkgname}/

	# copy license to appropriate directory
	install -DTm644 ${pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	# install helper script to assist with sourcing program
	install -DTm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}-init
}
