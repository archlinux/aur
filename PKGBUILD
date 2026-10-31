# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=prt
pkgver=0.6.1
pkgrel=1
_repo=prt
_tag=v0.6.1
_srcdir="$_repo-$pkgver"
pkgdesc="A terminal UI for monitoring network ports, inspecting owning processes, and managing SSH tunnels on macOS and Linux"
arch=('x86_64')
url="https://github.com/rekurt/prt.git"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rekurt/prt/archive/refs/tags/$_tag.tar.gz")
sha256sums=('bb04456e12f52235a791c0ef25585cb9d025bfa237c4a78d095dc8c2e74e5ac5')

build() {
	cd "$_srcdir"
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 target/release/prt "$pkgdir/usr/bin/prt"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
