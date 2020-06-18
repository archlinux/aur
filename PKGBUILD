# Maintainer: Bertrand "Kamek" Bousquet <b.kamek@gmail.com>

pkgname=ntfd-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight notification daemon for fancy desktop integrations"
depends=('ttf-weather-icons')
arch=('x86_64')
url="https://github.com/kamek-pf/ntfd"
license=("GPL")
provides=("ntfd")
source=("ntfd::${url}/releases/download/${pkgver}/ntfd-${arch}-unknown-linux-musl"
        "config.toml::https://raw.githubusercontent.com/kamek-pf/ntfd/${pkgver}/config.toml")
sha256sums=("272f6b4222fdf64160b66d95f4c4b44e564289b6a8feccdfdcc4c694b6862264"
            "7d181f1c27ab95aa9b216dcac55aaffc3c92b3eb81ab60c6ab62fd8700b362f1")

package() {
    install -Dm755 ntfd "${pkgdir}/usr/bin/ntfd"
    mkdir -p ~/.config/ntfd
    if [ ! -f ~/.config/ntfd/config.toml ]; then
        cp config.toml ~/.config/ntfd/config.toml
    fi
}
