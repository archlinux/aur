# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=rcedit-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.0
pkgrel=4
pkgdesc='Command line tool to edit resources of windows exe files'
arch=('any')
url="https://github.com/electron/${_pkgname}"
license=('MIT')
depends=('wine')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/electron/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x64.exe"
	"https://raw.githubusercontent.com/electron/${_pkgname}/v${pkgver}/LICENSE"
	"${_pkgname}.sh")
sha512sums=('c13e7ffd60169c348e16a3ea59a171c1777acdb241f950c11a6e9b69c955a3a4eb3432182aee7f489a87a555d0bd51fde3b597826f7c1e6488f1f5097359ab4d'
            'ca664e9ec12e6e23878c55f2b56e44fac50fc8b88c71499a4794fe3a0e8de18008c7435970628c8386410534dd5cc27af3ea5e7a818d6244f6159bc183969638'
            'ce46f14c4e7c945c69fdfbc48bfd22c8241f653a974f4950d8378bb81943144f5b3ee2e49cb08a26637c46558327184c6504714f7e781f86fbf7b0c64f561bd0')

package() {
	install -Dm755 "${_pkgname}-x64.exe" "${pkgdir}/opt/${_pkgname}/${_pkgname}-x64.exe"
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
