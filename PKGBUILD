# Maintainer: Francois LaBerge fgcrclaberge@gmail.com
pkgname="docs"
pkgver="0.0.1"
pkgrel=1
# epoch=
pkgdesc="search your man pages with fzf"
arch=("any")
url="https://github.com/FGRCL/docs"
license=('unkown')
groups=()
depends=(
	'fzf'
)
makedepends=(
	'rustup'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=
# changelog=
source=("https://github.com/FGRCL/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('96146ef6644375194146ab7f458a41fe63043217330570b1d296ad8b6e8729ad')
validpgpkeys=()

# prepare() {
# }

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
	chmod +x docs.sh
}

# check() {
# }
#
package() {
	cp "$pkgname-$pkgver/target/release/docs-parse" "$pkgdir/docs-parse"
	cp "$pkgname-$pkgver/docs.sh" "$pkgdir/docs"
}
