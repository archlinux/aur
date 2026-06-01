# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repo name
pkgver=0.30
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
sha256sums=('54f433202acee04e4af36ca382eb3a923d47189ca7552aa31b069db7d0968172')

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "${pkgname}.txt" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.txt"
	install -Dm644 "${pkgname}.html" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# icon installation (XDG spec)
	install -Dm644 "${pkgname}_light.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	install -Dm644 "${pkgname}_dark.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-dark.svg"
	install -Dm644 "${pkgname}_monochrome.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}-symbolic.svg"
}
