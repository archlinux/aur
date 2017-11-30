# Maintainer: jD91mZM2 <me@krake.one>
pkgname="powerline-rs"
pkgdesc="powerline-shell rewritten in Rust. Inspired by powerline-go."
pkgver=0.1.0
pkgrel=1
url="https://github.com/jD91mZM2/powerline-rs"
license=("MIT" "custom:MIT")
source=("https://github.com/jD91mZM2/powerline-rs/archive/v0.1.0.tar.gz")
sha256sums=('dee56f8808babb898ed848ebe2cdee88f1e903c6cc39dac0fbae5e05b8e00e3e')
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
makedepends=("libgit2" "cargo")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
