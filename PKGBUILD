# Maintainer: aquova <mail at aquova dot net>

pkgname="azaharplus-appimage"
_pkgver=2126.2-A
pkgver="${_pkgver//[.-]/_}"
pkgrel=1
pkgdesc="A fork of the Azahar 3DS emulator that restores some features"
arch=("x86_64")
url="https://github.com/AzaharPlus/AzaharPlus"
license=("GPL2")
provides=("azahar" "azaharplus")
conflicts=("azahar" "azaharplus")
depends=(ffmpeg sdl2)
source=(
    "$url/releases/download/AZAHAR_PLUS_${pkgver}/azaharplus-${_pkgver}-linux.AppImage"
    "azaharplus.desktop"
    "azahar.svg"
)
sha256sums=(
    '14b1541d1f2c3640987d8ddd6bf30c6ce04c3ecac93ff1ec729e81c66cc103dd'
    'ce8ab3a29aac5244a002793b41f7f45ce940894f42be71c0e47ec50d0e264634'
    'b7941099d70483350c3f1af82bdf55cda68203f12f2e8a9b09b23749de3a5caf'
)
options=("!strip")

package() {
    install -Dm 755 azaharplus-${_pkgver}-linux.AppImage $pkgdir/usr/bin/azahar
    install -Dm 644 $srcdir/azaharplus.desktop -t $pkgdir/usr/share/applications
    install -Dm 644 $srcdir/azahar.svg -t $pkgdir/usr/share/pixmaps
}

