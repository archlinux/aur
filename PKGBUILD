# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
_pkgname=BLAHAJ
pkgver=2.0.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
depends=('crystal' 'shards')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('776ae64f7221a1f422b66013025d090377c121e9024a8842fded62cadaa24e7f')

build () {
	cd "${_pkgname}-${pkgver}"
	make build_mt 
}

check () {
	cd "${_pkgname}-${pkgver}"
	make test 
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
