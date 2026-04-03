# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=stefanlogue
_pkgname=meteor
pkgname=${_pkgname}-bin
pkgver=0.31.0
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
sha256sums_x86_64=('5777daa357e5987dbc2d6f2bd0d64d1b908ddcbb7c34deec7401a8c46919417c')
sha256sums_i686=('587f3018838dce6bb7d1b21dce4299a5e5bd25689ca63a41224f5720373b55c5')
sha256sums_aarch64=('c099548092799cb5bb1065d5a78958beaaa8c58d0ce659907566c53246442720')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
