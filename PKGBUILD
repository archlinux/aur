# Maintainer: Michael Hauser-Raspe
_pkgname=wofi-symbol
pkgname=${_pkgname}-git
pkgver=0.r26
pkgrel=1
pkgdesc="Symbol picker for Wayland using wofi and wtype"
arch=("any")
url="https://github.com/mijoharas/wofi-symbol"
license=("MIT")
optdepends=("wofi" "wtype") # thanks to gilbs https://aur.archlinux.org/account/gilbs
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	echo "0.r$(git rev-list --count HEAD)"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
