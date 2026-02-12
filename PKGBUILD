# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: d3spair <aur@agrshv.dev>

_pkgauthor=gabrie30
_pkgname=ghorg
pkgname=${_pkgname}-bin
pkgver=1.11.9
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
sha256sums_x86_64=('730f161e886cb074d140d174d1031210b444c5bb902866873c988cb0978eb59d')
sha256sums_i686=('6dd3039b28c93f3a7b551bd80630fdddc47b0fd45e18c9cc55cf4c1a4523f9c8')
sha256sums_aarch64=('220c21476bcc2951b53249643b8a21d3b27f6b497f120613134d033f73a87776')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
