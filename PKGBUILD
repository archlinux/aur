# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: d3spair <aur@agrshv.dev>

_pkgauthor=gabrie30
_pkgname=ghorg
pkgname=${_pkgname}-bin
pkgver=1.11.13
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Quickly clone or backup an entire org/users repositories into one directory"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('8d581ac1fd16392265abea4f3494a1a52fc561c6227ad935593deb052d647302')
sha256sums_i686=('8e3ee01ce43c38fa24257a0759d6d44b1887040c47d15fd951410218337331e9')
sha256sums_aarch64=('ef5229b8a8c39de8f8008f80212e10029cf858aaa4920b793b457963a409c242')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
