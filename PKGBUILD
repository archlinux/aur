# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.12.1
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('03762905bacf8757703837e0fb5dd33b6d245bbd84163afce4e0d99ab744ec7640914bc98bc4138be6c70143eb411f3ac30f512fe93fc0a7c72b789bef514780')

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}   
