# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.11.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('9a8bd7049d38e8405a9872824fda53f4d36205b399d81163744710713b513d048e11b6ab9886f41a1d7c5d6ad6a1828204bdc9177b4296eda2f56d69833cac60')

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}   
