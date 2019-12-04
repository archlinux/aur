# Maintainer: Walter C <bitlord@disroot.org>

pkgname="pier"
pkgver=0.2.0
pkgrel=1
pkgdesc="A Linux script management CLI written in Rust"
arch=("i686" "x86_64")
url="https://github.com/BenSchZA/pier"
license=("MIT")
depends=()
makedepends=("rust" "cargo")
provides=("pier")
conflicts=("pier-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha384sums=("5fdb4893741fffc824b6f5e726f6a6efae2afc5371375fbc4ecd39565cd7541f3a492f04b4d4edcba3ad86494a509e7e")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}
    
check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
