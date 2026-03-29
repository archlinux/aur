# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: d3spair <aur@agrshv.dev>

_pkgauthor=gabrie30
_pkgname=ghorg
pkgname=${_pkgname}-bin
pkgver=1.11.10
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
sha256sums_x86_64=('28ccf93b5a320ec31589e1b84d3e58fc5661fbbeb1b6e892ca59346790c96850')
sha256sums_i686=('b29b79b7f247f6d6484a842733d08029a34932f582a0c943a42f4d707c243199')
sha256sums_aarch64=('ad807fa207a85a1ba373a25509d0c33a7ce6ac7bc4adb8d094f19df142a40f0f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
