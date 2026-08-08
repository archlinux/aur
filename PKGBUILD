# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ameshkov
_pkgname=gocurl
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Simplified version of curl written in pure Go with additional features"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[1]}-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[2]}-v${pkgver}.tar.gz")
sha256sums_x86_64=('884eaa4efdf019aaaa049239f38ea6891299e2c964635089a5c6ce9e94495e41')
sha256sums_i686=('cad2049b8d15e8505db69554a98d5ace2373d25c22861e8c5422e9ce43b44b48')
sha256sums_aarch64=('2e8985d3c77c5950c47a105c7fe8f8375487175ced87296151d2e878c8412e4c')


package() {
	cd "${srcdir}/linux-"* || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
