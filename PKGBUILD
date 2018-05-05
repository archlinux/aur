# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=2.0.3
pkgrel=1
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
depends=("gstreamer" "gst-plugins-base" "gst-plugins-bad" "libsixel")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9c9ab3b89b8357e0d6366677795a4cf363650efa869e16215af8fca1485e8d00')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --features bin
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
