# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=powersupply-git
pkgver=0.8.0
pkgrel=1
pkgdesc="GTK3 app to display power status of phones"
url="https://gitlab.com/MartijnBraam/powersupply"
arch=("any")
license=("AGPL3")
makedepends=("meson")
source=("git+https://gitlab.com/MartijnBraam/powersupply")
sha256sums=(SKIP)

build() {
	cd "${srcdir}"/powersupply
	arch-meson . _build
}

package() {
	cd "${srcdir}"/powersupply
	DESTDIR="${pkgdir}" ninja -C _build install
}
