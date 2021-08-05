# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=0.1.23
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('custom:MIT')
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
sha512sums=("319484815500da124bff7369800e88f3cc73c71c20488f7f1533174f61b52553b5abe3ec13d9c7cce09a97d931ef9bde9f170b9fcdbf6c9d260106d28c41e015")
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

