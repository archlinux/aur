# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=birtty-git
pkgver=1235e3b
pkgrel=1
pkgdesc="Try not to crash that bird"
url="https://github.com/vain/birtty"
license=("custom:PIZZA-WARE LICENSE")
makedepends=("gcc" "make")
source=("git+https://github.com/vain/birtty")
sha512sums=('SKIP')
arch=("i686" "x86_64")

pkgver() {
	cd birtty
	git describe --always
}

build() {
	cd "${srcdir}/birtty"
	make birtty
}

package() {
	cd "${srcdir}/birtty"
	install -Dm755 birtty "${pkgdir}/usr/bin/birtty"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/birtty/LICENSE"
}
