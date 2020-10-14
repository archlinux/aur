# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=0.1.7
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend-rs"
license=('GPL3' 'custom:MIT')
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
sha512sums=("2aa2b2a33cae3c2a39aec02cba664088377f0297eade3b29a2cd123ed10cbd801e8e3d6e82079677a253c36bf2c468b93c2ec033d0b83e4403c07bfb73f297db")
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

