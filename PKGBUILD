# Maintainer: Lncvrt <lncvrtreal@gmail.com>
pkgname=lncvrt-games-launcher
pkgver=1.9.2
pkgrel=2
pkgdesc="The official Lncvrt Games Launcher AUR Package!"
arch=('x86_64')
depends=('gtk3' 'libx11')
url="https://games.lncvrt.xyz"
source=(
    "https://archive.org/download/lncvrt-games-archive/lncvrt-games-launcher-new/Lncvrt-Games-Launcher-${pkgver}-linux-x64.deb"
)
sha256sums=(
    '11453a420d97dbc3a490476cfbf7d19fc8725507442e463df89119816a4de7a3'
)
options=('!strip')
package() {
    bsdtar -xf "${srcdir}/Lncvrt-Games-Launcher-${pkgver}-linux-x64.deb" -C "${pkgdir}" data.tar.*
    bsdtar -xf "${pkgdir}/data.tar."* -C "${pkgdir}"
    rm -f "${pkgdir}"/data.tar.*
}
