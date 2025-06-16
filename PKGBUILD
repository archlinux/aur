# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=inspircd
pkgname=${_pkgname}-dinit
pkgver=20250613
pkgrel=1
pkgdesc="InspIRCd is a modular Internet Relay Chat (IRC) server written in C++ for Linux, BSD, Windows and macOS systems. (dinit)"
arch=('any')
source=(
	"${_pkgname}.service"
	"${_pkgname}-pre.service"
)
depends=("${_pkgname}")
sha256sums=(
	'f434aefadde9b8716eba4f60defe073243b953d2ceee4736cdc0316470d1c47d'
	'0a2ed1cc3810b24f3b21c9ccb52a89b0f1dcd1ee5f98ad6ab4b27ba508828972'
)

package() {
	install -Dm644 "${_pkgname}.service" "$pkgdir/etc/dinit.d/${_pkgname}"
	install -Dm644 "${_pkgname}-pre.service" "$pkgdir/etc/dinit.d/${_pkgname}-pre"
}
