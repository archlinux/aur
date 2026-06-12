# Maintainer: Francois LaBerge fgcrclaberge@gmail.com
pkgname="docs"
pkgver="0.0.2"
pkgrel=2
# epoch=
pkgdesc="search your man pages with fzf"
arch=("any")
url="https://github.com/FGRCL/docs"
license=('unkown')
groups=()
depends=(
	'fzf'
	'tldr'
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
sha256sums=('fb6ef71ce007ff9d4259a5100897f348d34b782e92c9f9f4885fdd9f70f05563')
validpgpkeys=()

# prepare() {
# }

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

# check() {
# }

package() {
	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/bin/"
	cp "$pkgname-$pkgver/target/release/docs" "$pkgdir/usr/bin/docs"
	cp "$pkgname-$pkgver/target/release/tldocs" "$pkgdir/usr/bin/tldocs"
}
