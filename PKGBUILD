# Maintainer: Bojan Milevski <bojan@bojanmilevski.com>

pkgname="gex-git"
_pkgname="gex"
pkgver=0.4.1
pkgrel=1
pkgdesc="Install Gecko Browser extensions through the command line."
arch=("any")
url="https://github.com/bojanmilevski/gex.git"
license=("GPL3")
makedepends=("rust" "cargo" "git")
provides=("gex")
conflicts=("gex")
source=("git+https://github.com/bojanmilevski/gex.git")
sha256sums=('SKIP')

build() {
	cd "$_pkgname"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm 755 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
