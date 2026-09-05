# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=tascli
pkgver=0.14.1
pkgrel=1
pkgdesc="A simple, fast, local task and record manager in CLI"
arch=('x86_64')
url="https://github.com/Aperocky/tascli"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.14.1"
_srcdir="tascli-0.14.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Aperocky/tascli/tar.gz/refs/tags/$_tag")
sha256sums=('e7ce1b10383724bac04ca8927895693945838e8bee5c43cf89c4ab458b65fb1d')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/tascli" "$pkgdir/usr/bin/tascli"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
