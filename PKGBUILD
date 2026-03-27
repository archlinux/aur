# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: sdvcrx <memory.silentvoyage@gmail.com>

_pkgauthor=simeji
_pkgname=jid
pkgname=${_pkgname}-bin
pkgdesc="JSON Incremental Digger"

pkgver=1.1.1
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

sha256sums=('33e23ebe03a2ccdbd130f756e080483a9812e5b2764711ef2ba037efc8551b3d'
            '3db4ceef736801baccfff1bc4d6ea64dc889dcc43cfc49151907ab98538f8c2d')
sha256sums_i686=('75bdef25a23a4cd3533281ea7d8f0418ae32a1982884a2f7978b724ef00bc801')
sha256sums_x86_64=('4bce81954d7dabf5f930d72496cfb4825816633988edd54804966b37e7464a6c')
sha256sums_aarch64=('f9bbce9ee6a9fe1c21881e3fb4d00d8169177873f74354a873b3f5cc05c4e990')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
