# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
_gitname=spotify-player
pkgver=0.3.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=("x86_64")
url="https://github.com/aome510/spotify-player"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/spotify-player/archive/v$pkgver.tar.gz")
sha512sums=('b892009ecdde03df21c5e06a5af435e4a199919d748b6f86a0860195adc02ea0a070302b8db8b6204f022426906d3f16c6d5afc36a9f890c64fd4551e015ebc2')

build() {
    cd "${_gitname}-$pkgver"

    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${_gitname}-$pkgver"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
