# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=e-tho
_pkgname=pwmenu
pkgname=${_pkgname}-bin
pkgdesc="Launcher-driven audio manager for Linux"

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
depends=('glibc' 'libgcc' 'libpipewire')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('0862aab1964b15b192d87d11164101738a671fc7533221af5240fb7e4d76ee59'
            '5735febb4249f2fea35481266e47668eb890404f83714ec3d12f68e80c95d72f')
sha256sums_x86_64=('72e5f128a82194aa85caf406fcffd6d995cc0e7e4135f6cc1dfc9bce2f15413e')
sha256sums_aarch64=('e74ba334555f62c84d2131fdf0ec593d717f06d990ccfbb3f98c2c2dbdf7bcbe')


package() {
	cd "${srcdir}" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
