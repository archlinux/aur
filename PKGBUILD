# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: sdvcrx <memory.silentvoyage@gmail.com>

_pkgauthor=simeji
_pkgname=jid
pkgname=${_pkgname}-bin
pkgdesc="JSON Incremental Digger"

pkgver=1.1.3
pkgrel=1
_pkgvername=v${pkgver}

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

arch=("i686" "x86_64" "aarch64")
_barch=('linux_386' 'linux_amd64' 'linux_arm64')

license=("MIT")

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_i686=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.zip")
source_x86_64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}.zip")

sha256sums=('55df4cafaed09779fc86d697f5327c02c70fb699c02713bee5f830dc89a4b8d6'
            '3db4ceef736801baccfff1bc4d6ea64dc889dcc43cfc49151907ab98538f8c2d')
sha256sums_i686=('350edd7644ebb7a8fbc6719207977e7399e6d139471fe7072cfe60e1fa2c62f8')
sha256sums_x86_64=('e3731dfbf3948113df78b4ef642c4f85b7bd6732c11f66f71489cf9152a42701')
sha256sums_aarch64=('ee4eb30853597c48d304b63fc6fb9e058ff2c039b296ce3506fc7b1a77a9b58b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
