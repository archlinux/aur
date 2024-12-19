# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Code-Hex
_pkgname=pget
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Fast, resumable, and parallel file download client, written in go."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_.${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_.${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_.${pkgver}_Linux_arm64.tar.gz")
sha256sums=('5d27c3c2c001baaa25373708654d0ec95fdb043285508e98ec03ca51636a27e4'
            'dc8c72a0a304d36d609f1e05b087d3616976aa865babdc0cc01b889256cc1a15')
sha256sums_x86_64=('a03327eb18616e523686fdc9e997c6be7d4bf313c8313d57316964a63cac3381')
sha256sums_i686=('a7c579b092acf3f683b5048b2687a42a06a9995b69d47a5327634af712bff718')
sha256sums_aarch64=('8d8eb0a84fe5fb9ad1bc6820d73693de3f0582d044e7977db71f5992ff5883c9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
