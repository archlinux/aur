# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repo
pkgver=0.28
pkgrel=3
pkgdesc='Calculate elapsed time. Check moon phases, Easter dates and next Friday 13th.'
url='https://github.com/mountaineerbr/shellDatediff'
arch=('any')
license=('GPL3')
depends=('bash')
optdepends=(
	'coreutils: date: convert input to iso-8601'
	'bc: fractional time units'
)
source=("https://github.com/mountaineerbr/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.tar.zst")
sha256sums=('4594e5302b034340b91965a6c6af5d09bd71b2d61f029a8ccb3a75160b81359f')

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
