# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
_gitname=spotify-player
pkgver=0.1.0
pkgrel=2
pkgdesc="A command driven spotify player."
arch=("x86_64")
url="https://github.com/aome510/spotify-player"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/spotify-player/archive/v$pkgver.tar.gz")
sha512sums=('d629170f71bf06d25fa0f1f97b4ce31364152770017a8825c1d771177d6e28ac6dff9c6d8c4a5d01795a2372a14ce4109e40b0d3dc0753788bc60984a79a5ff8')

build() {
    cd "${_gitname}-$pkgver"

    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${_gitname}-$pkgver"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
