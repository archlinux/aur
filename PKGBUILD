# Maintainer: Francois LaBerge fgcrclaberge@gmail.com
pkgname="docs"
pkgver="0.0.3"
pkgrel=5
# epoch=
pkgdesc="search your man pages with fzf"
arch=("any")
url="https://github.com/FGRCL/docs"
license=('unkown')
groups=()
depends=(
	'fzf'
	'tealdeer'
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
sha256sums=('bde1594125d5ac188cde5af52fee54221b463c4d1f419d9781eb3e2ba16ad6aa')
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
