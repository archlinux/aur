# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: sdvcrx <memory.silentvoyage@gmail.com>

_pkgauthor=simeji
_pkgname=jid
pkgname=${_pkgname}-bin
pkgdesc="JSON Incremental Digger"

pkgver=1.0.0
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

sha256sums=('db684d59d55515e25177870ae9d807cec6e562296c5f8171c1db70bcad4f45a6'
            '3db4ceef736801baccfff1bc4d6ea64dc889dcc43cfc49151907ab98538f8c2d')
sha256sums_i686=('3c4e1785c747760d23b52bace04ca23f18df77f2bc051f1fb520e494fb216071')
sha256sums_x86_64=('90dc218336712c130c6d2d572521a00a949aa6f662702ba5c807a5c168755ab7')
sha256sums_aarch64=('aeae5c409ca77b248acba0b772d21a69078c7017c4cc9be3d4476bd49f685739')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
