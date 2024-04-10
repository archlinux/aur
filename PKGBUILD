# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=inspircd
pkgname=${_pkgname}-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="InspIRCd is a modular Internet Relay Chat (IRC) server written in C++ for Linux, BSD, Windows and macOS systems. (dinit)"
arch=('any')
source=(
	"${_pkgname}.service"
	"${_pkgname}-pre.service"
)
depends=("${_pkgname}")
sha256sums=(
	'05fec235b54b10f321026ba492deaa4f2ac884448566fa594f7bf05d59dbe47d'
	'c466741bc696f069493725bb623368f819588ccc100b6ec5d1147e1c056af134'
)

package() {
	install -Dm644 "${_pkgname}.service" "$pkgdir/etc/dinit.d/${_pkgname}"
	install -Dm644 "${_pkgname}-pre.service" "$pkgdir/etc/dinit.d/${_pkgname}-pre"
}
