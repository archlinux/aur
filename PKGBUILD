# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=0.1.29
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
sha512sums=("4d64f311804ec9b48ad06484c78df0b83f1d244afb76cf4d7d053ff11b81a27ea8f2bcc4a688e813ad7f89eca3ee9edda965416967bf7efdecee3ff83d322e6d")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

