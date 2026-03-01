# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=e-tho
_pkgname=iwmenu
pkgname=${_pkgname}-bin
pkgdesc="Launcher-driven Wi-Fi manager for Linux"

pkgver=0.4.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux-gnu' 'aarch64-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('d0798bac294e2c13e91dc2d0c1aea119f48129d2aed109e534cb2ea2f71529d9'
            '5735febb4249f2fea35481266e47668eb890404f83714ec3d12f68e80c95d72f')
sha256sums_x86_64=('2e0b366faa37a76c4c9bfe4bfec506a1c4008e4dedf2639b407d168894d993df')
sha256sums_aarch64=('c735bc61d56cd8378deac77ae79a5cb39454fff869120c9acb45ccf60f7fef7b')


package() {
	cd "${srcdir}" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
