# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tanciaku
_pkgname=tmmpr
pkgname=${_pkgname}-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal mind mapper"

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=('617a800bbebeb04eebaeec269ddcab8b7c0b64ad86b85ad48da547cca82645c5'
            '0ddd6685935c91808519074735f2477929200fa208dc23c29f1a0bd088e63886')
sha256sums_x86_64=('3fc24799c34f2ec58151fdf4b6e7927f05d867833e9404da5ee49f14886acaea')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
