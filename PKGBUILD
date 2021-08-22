# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-git
pkgver=0.r739
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("git" "go")
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
	make build
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
