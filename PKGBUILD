# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=cloud-buster
pkgver=1.0
pkgrel=3
pkgdesc="A cloudflare-resolver"
arch=('any')
url="https://github.com/SageHack/cloud-buster"
license=('GPL3')
depends=('python')
optdepends=('python-dnspython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SageHack/cloud-buster/archive/v${pkgver}.tar.gz" "cloud-buster.sh")
sha512sums=('7705e4af78eb3e372ede8a299a89c0353b76cddc33f9a2e3136d7fa16ef238153fb654fcd18597efe95e08dc293c77c946b2b63b911bd6212a37b0fd7dd578a1'
            'bb773d1c650e1667a91aa67d9bbf1ae683e190a6f2a320665dc077ac8fdedd95294721f9e0f2c7a6adc195ab2873d7638b62bca0656a0bf33fe8539fc890d49c')

build() {
	cd "${pkgname}-${pkgver}"
	python -O -m compileall .
}

package() {
	mkdir -p "${pkgdir}/usr/share/"
	install -D -m755 "${srcdir}/cloud-buster.sh" "${pkgdir}/usr/bin/cloud-buster"
	cd "${srcdir}"
	mv "${pkgname}-${pkgver}" "${pkgdir}/usr/share/"

}

# vim:set et sw=2 ts=2 tw=79:
