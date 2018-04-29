# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=2.0.0
pkgrel=2
pkgdesc="Play an image/video in your terminal!"
arch=("x86_64")
url="https://github.com/jD91mZM2/termplay"
license=("MIT" "custom")
makedepends=("rust" "openal" "libsndfile" "gstreamer" "gst-plugins-base" "gst-plugins-bad")
optdepends=(
    "ffmpeg: Video support"
    "maim: Screen-mirroring support"
    "youtube-dl: YouTube support"
)
depends=("libsixel")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('26140b14e93336b606c457e03e7c5bcbb243373cf1e0a2cd2d0a0197d3cf9394')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --example termplay --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/examples/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
