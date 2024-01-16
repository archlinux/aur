# Maintainer: Willy Micieli <micieli at vivaldi.net>
# Contributor: Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=7.0.0
pkgrel=2
pkgdesc="A git hook test runner for rust programer" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'git-graph' 'rsbadges' 'wget' 'git' 'ranger' 'lazygit' 'cargo-audit')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('54da9555c364fa1eff3565d966af839cc62773e1a2ce4593523891b45078e36c')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
