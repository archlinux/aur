# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=stefanlogue
_pkgname=meteor
pkgname=${_pkgname}-bin
pkgver=0.30.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A highly configurable CLI tool for writing conventional commits"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[2]}.zip")
sha256sums_x86_64=('29a06f76c23942ddcb8b6295a942781b8563d8902cd2a0d749a2fa8cdd62b031')
sha256sums_i686=('9ea17352e62cd47f0ef3c6410bfd02d9f0a450b02d1128dc05803df165e54e2d')
sha256sums_aarch64=('5665f81470f696644ee5c9ca43365621c2a21bc11b590e4af07496c7403b6618')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
