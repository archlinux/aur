# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repo
pkgver=0.29
pkgrel=1
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
sha256sums=('540b916cfe8ff4bd701513b1c2135976424a7e5e7b46098da06a4023bcddc517')

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
