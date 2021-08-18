# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
_gitname=spotify-player
pkgver=0.1.1
pkgrel=1
pkgdesc="A command driven spotify player."
arch=("x86_64")
url="https://github.com/aome510/spotify-player"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/spotify-player/archive/v$pkgver.tar.gz")
sha512sums=('f8dd7b505eb7dd3d2699fe5eb514e50caf854b7317ef026228e33d3c903d35441a3ff1fb0272dacde07695ae788761b4dd39f8877d6631240781d26e2382e2f9')

build() {
    cd "${_gitname}-$pkgver"

    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${_gitname}-$pkgver"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
