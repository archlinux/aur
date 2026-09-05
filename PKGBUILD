# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=is-fast
pkgver=0.17.7
pkgrel=1
pkgdesc="TUI tool for quick, efficient internet searches directly from the terminal"
arch=('x86_64')
url="https://github.com/Magic-JD/is-fast"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.17.7"
_srcdir="is-fast-0.17.7"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Magic-JD/is-fast/tar.gz/refs/tags/$_tag")
sha256sums=('031ac21094cb3b276c3b36eee114aec6b9dd978e91aa4fe2cd4f669c35002963')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/is-fast" "$pkgdir/usr/bin/is-fast"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
