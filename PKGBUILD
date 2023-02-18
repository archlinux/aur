# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.12.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('fb9ca3c1aeabebd2fd7ef7202183440dff8946ced89e6b19d64ff92ff21c64d3e7d570209ff534f4d46805f2fa0ae19efaf3edaedba5699342e86d05926cea8b')

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}   
