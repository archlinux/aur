# Maintainer: Zeioth
# Original author: dln
_pkgname=wofi-emoji
pkgname=wofi-emoji
pkgver=1.2
pkgrel=3
pkgdesc="Emoji picker for Wayland using wofi and wtype"
arch=("any")
url="https://github.com/Zeioth/wofi-emoji"
license=("MIT")
depends=("wofi" "wtype" "wl-clipboard" ) # thanks to gilbs https://aur.archlinux.org/account/gilbs
makedepends=("git" "jq"  "curl")
provides=(wofi-emoji)
conflicts=(wofi-emoji-git)
source=("git+$url#commit=524fd0db66f8a96a2365f5af85b5b08032680359")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	./build.sh
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
