# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=1.2.0
pkgrel=3
pkgdesc="Play an image/video in your terminal!"
arch=("x86_64")
url="https://github.com/jD91mZM2/termplay"
license=("MIT" "custom")
makedepends=("cargo" "openal" "libsndfile")
optdepends=("maim: Screen-mirroring support")
depends=("libsixel")
source=("https://github.com/jD91mZM2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("d30e4c3b3e20ac467fdd5ba9f725f1a71e388ff8b8fe81d74447fddb95e49609")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
