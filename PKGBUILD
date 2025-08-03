# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yarlson
_pkgname=lnk
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="🔗 Git-native dotfiles management that doesn't suck."
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}.tar.gz")

sha256sums_x86_64=('12465d0bbf7b3f4f14028b7e34c5f9ff0fd36045af9591a0bcced873abc19470')
sha256sums_aarch64=('10d604681c5bfb933a2d2e2097f944ca39fe0b386009246a9d510aa8e2f029af')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
