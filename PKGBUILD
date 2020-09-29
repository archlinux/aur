# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=0.1.4
pkgrel=2
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
sha512sums=("38fcfce4b5a67c5eb00bfd2fda7db03584a5e79390c31f7a92e5a3a7b576b922b4541ba9ba3818746ea28a0878c45b93437650e8d41feb388959c7972eafd3f3")
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
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

