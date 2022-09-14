# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.6
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0f35b121c65ead537bf888c935e7b96ceaa154e892686edc1c0e780da3ffa5e1')
sha256sums_i686=('17e92404e43930eb9aedbf38cf002a7b1cd9dc3d776b9e53d23552fec7439b41')

package() {
	cd "${srcdir}"
	
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
