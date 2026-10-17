# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repository
pkgver=0.31
pkgrel=1
pkgdesc='Calculate elapsed time. Check moon phases, Easter dates and next Friday 13th.'
url='https://github.com/mountaineerbr/shellDatediff'
arch=('any')
license=('GPL3')
depends=('bash')
optdepends=(
	'bc: fractional time and large number arithmetics'
	'date: process input formats other than iso-8601'
)
source=("https://github.com/mountaineerbr/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.tar.zst")
sha256sums=('c6cfd4d5b767ab6d403830a270b4dc0db07aa4eb1d6f3f8c8320cf59e0478486')

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm644 "${pkgname}_light.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	install -Dm644 "${pkgname}_dark.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-dark.svg"
	install -Dm644 "${pkgname}_monochrome.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-symbolic.svg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "${pkgname}.txt" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.txt"
	install -Dm644 "${pkgname}.html" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
