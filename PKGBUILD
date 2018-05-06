# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=2.0.4
pkgrel=1
pkgdesc="Play an image/video in your terminal!"
arch=("x86_64")
url="https://github.com/jD91mZM2/termplay"
license=("MIT")
makedepends=("rust" "openal" "libsndfile" "gstreamer" "gst-plugins-base" "gst-plugins-bad")
optdepends=(
    "ffmpeg: Video support"
    "maim: Screen-mirroring support"
    "youtube-dl: YouTube support"
)
depends=("gstreamer" "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly" "gst-plugins-bad" "libsixel")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('54673b3f09920a724fbc8c2b7fe0dff1ed9bdf5695fdc48631f42bb994028681')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --features bin
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
