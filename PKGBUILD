# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=1.3.0
pkgrel=4
pkgdesc="Play an image/video in your terminal!"
arch=("x86_64")
url="https://github.com/jD91mZM2/termplay"
license=("MIT" "custom")
makedepends=("rust" "openal" "libsndfile")
optdepends=(
    "ffmpeg: Video support"
    "maim: Screen-mirroring support"
    "youtube-dl: YouTube support"
)
depends=("libsixel")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('417e533f37354135491ea45d85f65ed1d5b08adc7c718390a0528792aa8455d6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
