# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.9.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('f13942f0056b7790822544e9d2ffadd16851120a6817fcbbdce5b31ade43961fc5b8fb21d1527dc5306388c701288004e39fbbbbb95a3eee8fda79fe5a10c24e')

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}   
