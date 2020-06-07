# Maintainer: Bertrand "Kamek" Bousquet <b.kamek@gmail.com>

pkgname=ntfd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight notification daemon for fancy desktop integrations"
depends=('ttf-weather-icons')
arch=('x86_64')
url="https://github.com/kamek-pf/ntfd"
license=("GPL")
provides=("ntfd")
source=("ntfd::${url}/releases/download/${pkgver}/ntfd-${arch}-unknown-linux-musl"
        "config.toml::https://raw.githubusercontent.com/kamek-pf/ntfd/${pkgver}/config.toml")
sha256sums=("5eeba828b5cbfb9def926b37cb0bab2595bef1d15f8e118b47ed23620e1f707b"
            "fc1406cf489e074f521310258a09fc14e9d54733f9f3fa52c0904e1b871ed7b8")

package() {
    install -Dm755 ntfd "${pkgdir}/usr/bin/ntfd"
    mkdir -p ~/.config/ntfd
    if [ ! -f "~/.config/ntfd/config.toml" ]; then
        cp config.toml ~/.config/ntfd/config.toml
    fi
}
