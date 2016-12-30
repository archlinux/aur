# Maintainer: Flat <Flat@imo.uto.moe>
pkgname=parallel-rust
pkgver=0.8.0
pkgrel=1
pkgdesc="Inspired by GNU Parallel, a command-line CPU load balancer written in Rust."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/parallel"
license=('MIT')
depends=('gcc-libs-multilib')
makedepends=('rust-nightly' 'cargo-nightly')
optdepends=('dash: increased performance over sh')
provides=('parallel')
conflicts=('parallel')
source=("https://github.com/mmstick/parallel/archive/$pkgver.tar.gz")
md5sums=('ef2f9190e28a1d3531a9459f19893361')

build() {
	cd "parallel-$pkgver"
	cargo build --release
}

package() {
	cd "parallel-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install target/release/parallel $pkgdir/usr/bin
	install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
