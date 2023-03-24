#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=neofetch-port
pkgver=r2.0fc08c9
arch=("x86_64")
pkgrel=1
pkgdesc="A port that just reponse with the output of neofetch..."
license=("MIT")
makedepends=("make")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("git+https://github.com/LevitatingBusinessMan/$pkgname.git")
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
	mkdir -p "$pkgdir/usr/bin/"
	mv $pkgname "$pkgdir/usr/bin/$pkgname"
}
