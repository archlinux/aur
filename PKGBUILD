# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.9.8
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('0e0f671749318171a2608f81950d49a9b353df4a670ad824d28051b8a01643b55d1b204034372505aa1549459b53dea5b3f5ce7d78f3cf1c1e46c3ee8bd6b599')

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}   
