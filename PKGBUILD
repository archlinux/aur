# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.4
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums=('0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f')
sha256sums_x86_64=('a66b3960e07c95452a0ea3d6335d639dae0441467c59179b0968d468faa02d72')
sha256sums_i686=('4935751f878be1197263c6d517333fbc6bf45177c3f52e23f091a5afd1555894')

package() {
	cd "${srcdir}"
	
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
