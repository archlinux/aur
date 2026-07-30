# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SurgeDM
_pkgname=surge
pkgname=${_pkgname}-bin
pkgdesc="An open-source terminal (TUI) download manager"

pkgver=0.11.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('522e9e30218800d769bbd3b72ec1d2a98d8cc26c6059847d17ef1dbc9ea11906')
sha256sums_i686=('a26adf15ea07cb1341b9ddeba3fe54a16eeee5590c193071301b54354ddb4fee')
sha256sums_aarch64=('9783e52bc4f655cc7958c228af9c426628025710612a1f799669b008db5948b4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
