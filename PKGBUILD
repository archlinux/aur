# Maintainer: yorunoken
# Original author: dln
_pkgname=wofi-kaomoji
pkgname=wofi-kaomoji
pkgver=1
pkgrel=1
pkgdesc="Kaomoji picker for Wayland that uses wofi"
arch=("any")
url="https://github.com/yorunoken/wofi-kaomoji"
license=("MIT")
depends=("wofi" "wtype" "wl-clipboard" )
makedepends=("git" "jq" "curl")
provides=(wofi-kaomoji)
source=("git+$url#commit=d8633fc40bc2668a29d129873b68f8dcf26461f9")
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

