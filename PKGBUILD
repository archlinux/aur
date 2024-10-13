# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repo
pkgver=0.24.4
pkgrel=2
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
sha256sums=('32639c848c3dbcb1f39b82be7166a759c3dc24ba0b5779c339152dd28cfe8afc')

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "${pkgname}.txt" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.txt"
	install -Dm644 "${pkgname}.html" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
