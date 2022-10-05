#Maintainer: Rein Fernhout (LevitatingBusinessMan) <public@reinfernhout.xyz>

pkgname=lovecraft
pkgver=r13.052ecf4
arch=("x86_64")
pkgrel=1
pkgdesc="Print random paragraphs from Lovecrafts stories"
license=("MIT")
makedepends=("make" "git")
url="https://github.com/LevitatingBusinessMan/lovecraft"
source=("git+https://github.com/LevitatingBusinessMan/lovecraft.git")
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" PREFIX="/usr" make install
}
