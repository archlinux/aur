# Maintainer: Daniel Bray m@daniel-bray.com
_pkgname=fuzzy_clock
pkgname=fuzzy_rust_clock
pkgver=1.0
pkgrel=1
pkgdesc="Simple fuzzy clock text generator"
arch=(x86_64)
url="https://github.com/Daniel-Bray-Aber/${pkgname}"
license=('GPL')
makedepends=('cargo')
source=("${url}/releases/download/${pkgver}/${_pkgname}.${pkgver}.tar.gz")
sha256sums=('9893429a8da761d0c816904f440bb4ff414515c28641b8a27a680a13da2b6275')
build() {
	cd "$_pkgname"
	cargo build --release
}
package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$_pkgname/target/release/fuzzy_clock" "$pkgdir/usr/bin/"
}
