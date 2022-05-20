# Maintainer: Brodi <me@brodi.space>
_pkgname=wofi-emoji
pkgname=${_pkgname}-git
pkgver=0.r11
pkgrel=2
pkgdesc="Emoji picker for Wayland using wofi and wtype"
arch=("any")
url="https://github.com/dln/wofi-emoji"
license=("MIT")
depends=("wofi" "wtype") # thanks to gilbs https://aur.archlinux.org/account/gilbs
makedepends=("git" "jq")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	echo "0.r$(git rev-list --count HEAD)"
}

build() {
	cd "${pkgname}"
	./build.sh
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
