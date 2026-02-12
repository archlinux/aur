# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dorcha-inc
_pkgname=orla
pkgname=${_pkgname}-bin
pkgdesc="A dead-simple unix tool for lightweight open-source local agents"

pkgver=1.1.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums_x86_64=('6efe27f95f80d55bf936d627775148cbf1f15e0013251b60214d7a6b586add1c')
sha256sums_aarch64=('37cb4a626eff423f997e04818c648712746d1b0e8d8b638ac1809df4644d65ae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
