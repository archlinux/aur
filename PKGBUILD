# Maintainer: Bertrand "Kamek" Bousquet <b.kamek@gmail.com>

pkgname=ntfd-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight notification daemon for fancy desktop integrations"
depends=('ttf-weather-icons')
arch=('x86_64')
url="https://github.com/kamek-pf/ntfd"
license=("GPL")
provides=("ntfd")
source=("ntfd::${url}/releases/download/${pkgver}/ntfd-${arch}-unknown-linux-musl"
        "config.toml::https://raw.githubusercontent.com/kamek-pf/ntfd/${pkgver}/config.toml")
sha256sums=("a2afa7b550112fc805809b9859c4426d5d3478f85933bb9630d3ea8defc4f225"
            "4d2c00c071efb810d1b4ec3e96652a27c1101000843b44ff1476a33ab62839f2")

package() {
    install -Dm755 ntfd "${pkgdir}/usr/bin/ntfd"
    mkdir -p ~/.config/ntfd
    if [ ! -f ~/.config/ntfd/config.toml ]; then
        cp config.toml ~/.config/ntfd/config.toml
    fi
}
