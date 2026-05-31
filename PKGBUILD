# Maintainer: f-o-o-g-s <tollwitch@proton.me>
pkgname=nokkvi-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A native Rust/Iced desktop client for Navidrome music servers"
arch=('x86_64')
url="https://github.com/f-o-o-g-s/nokkvi"
license=('GPL-3.0-only')
depends=('pipewire' 'fontconfig' 'alsa-lib' 'hicolor-icon-theme')
provides=('nokkvi')
conflicts=('nokkvi')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/nokkvi-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('2738c4b079cfae2a903af59f4b384170caf1ce55466f6730b906ad8cfbcfbd34')

package() {
    cd "${srcdir}/nokkvi-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm755 nokkvi "${pkgdir}/usr/bin/nokkvi"

    install -Dm644 assets/org.nokkvi.nokkvi.desktop \
        "${pkgdir}/usr/share/applications/org.nokkvi.nokkvi.desktop"

    install -Dm644 assets/org.nokkvi.nokkvi.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.nokkvi.nokkvi.svg"

    install -Dm644 assets/org.nokkvi.nokkvi.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.nokkvi.nokkvi.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
