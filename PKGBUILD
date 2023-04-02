# Maintainer: Jamil SN <jamilbio20@gmail.com>
pkgname='datediff.sh'
_pkgname='shellDatediff'  #repo
pkgver=0.23.5
pkgrel=1
pkgdesc='Calculate elapsed time. Check moon phases, Easter dates and next Friday 13th.'
url='https://github.com/mountaineerbr/shellDatediff'
arch=('any')
license=('GPL3')
depends=('ksh')
optdepends=(
	'coreutils: c-code date to convert input to iso-8601'
	'bc: fractional time units (bash only)'
)
source=("https://github.com/mountaineerbr/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.tar.zst")
sha256sums=('bc2e303ee264f131de5b53580784c89fbdb6d3cb22592ecc5e9bd1a7496c1fdf')

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
