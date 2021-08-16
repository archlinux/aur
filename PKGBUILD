# Maintainer: Brodi <me@brodi.space>
_pkgname=gnirehtet
pkgname=${_pkgname}-bin
pkgver=2.5
pkgrel=1
pkgdesc="Gnirehtet provides reverse tethering for Android"
arch=("x86_64")
url="https://github.com/Genymobile/gnirehtet"
license=("Apache-2.0")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=(
	"${url}/releases/download/v${pkgver}/gnirehtet-rust-linux64-v${pkgver}.zip"
	"https://raw.githubusercontent.com/Genymobile/gnirehtet/master/LICENSE"
)

sha256sums=(
	"2b1ce04540e8de5df5ddbebb64bb01e27c13d556b3a04a8563dcce3786765705"
	"SKIP"
)

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/${_pkgname}"
	
	cd ${srcdir}/${_pkgname}-rust-linux64
	install -Dm755 ${_pkgname}.apk "${pkgdir}/usr/share/${_pkgname}"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

