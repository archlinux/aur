# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=s0rg
_pkgname=decompose
pkgname=${_pkgname}-bin
pkgver=1.11.8
pkgrel=1
pkgdesc="Reverse-engineering tool for docker environments"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('428fcd3866af2b318a8dde8e968185c5cd59a1acdc6415e03d624873038b4a69')
sha256sums_aarch64=('c75db2a4907266592a2967529ec61773fa118970a560b31e60ec383e11b20b5d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
