# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benhoyt
_pkgname=goawk
pkgname=${_pkgname}-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="A POSIX-compliant AWK interpreter written in Go, with CSV support"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('eda07f45b623ea9a82e9578e69632f79dd52321f2af7ff3b43935be7b805d675')
sha256sums_i686=('25994e38d07016ffb4aea2c7cd5e3cafc62907976b7dd38f59129bdb6225e2e0')
sha256sums_aarch64=('dad03aa7f07c49770bf6ffb2244716c05b21bfbc2f2d453170d3c1173a43dd5a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/cover.md" "${pkgdir}/usr/share/doc/${pkgname}/COVER.md"
	install -Dm644 "docs/csv.md" "${pkgdir}/usr/share/doc/${pkgname}/CSV.md"
}
