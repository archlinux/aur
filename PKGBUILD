# Maintainer: Bertrand "Kamek" Bousquet <b.kamek@gmail.com>

pkgname=ntfd-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A lightweight notification daemon for fancy desktop integrations"
depends=('ttf-weather-icons')
arch=('x86_64')
url="https://github.com/kamek-pf/ntfd"
license=("GPL")
provides=("ntfd")
source=("ntfd::${url}/releases/download/${pkgver}/ntfd-${arch}-unknown-linux-musl"
        "config.toml::https://raw.githubusercontent.com/kamek-pf/ntfd/${pkgver}/config.toml")
sha256sums=("272f6b4222fdf64160b66d95f4c4b44e564289b6a8feccdfdcc4c694b6862264"
            "a28712a31afd60c1e3e81b48591f7d69bf7c138256690bf2fd3581669ebe20eb")

package() {
    install -Dm755 ntfd "${pkgdir}/usr/bin/ntfd"
    mkdir -p ~/.config/ntfd
    if [ ! -f ~/.config/ntfd/config.toml ]; then
        cp config.toml ~/.config/ntfd/config.toml
    fi
}
