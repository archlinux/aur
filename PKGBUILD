# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: d3spair <aur@agrshv.dev>

_pkgauthor=gabrie30
_pkgname=ghorg
pkgname=${_pkgname}-bin
pkgver=1.11.18
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
sha256sums_x86_64=('1fd5ff435f551485b1cf2ab8776d0468e5ef90170e1b56a287e12e28b2a23405')
sha256sums_i686=('a119b5d53ce2310e733ced7854c354989312aca505ab90c9c5d270b1efb5d059')
sha256sums_aarch64=('0b4172863153be0377a4ca75b7839a2cb62f52f499e123e6a9d829145815c27d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
