# Maintainer: aquova <mail at aquova dot net>

pkgname="azaharplus-appimage"
pkgver=2123_3_A
_pkgver=2123.3-A
pkgrel=1
pkgdesc="A fork of the Azahar 3DS emulator that restores some features"
arch=("x86_64")
url="https://github.com/AzaharPlus/AzaharPlus"
license=("GPL2")
provides=("azahar" "azaharplus")
conflicts=("azahar" "azaharplus")
depends=(ffmpeg sdl2)
source=(
    "$url/releases/download/AZAHAR_PLUS_${pkgver}/azaharplus-${_pkgver}-linux.zip"
    "azaharplus.desktop"
    "azahar.svg"
)
sha256sums=(
    '5b24923ca2c9b28e9e3329311d67dd2ff1aee7b470d70f9a20643db8fa40ccd2'
    'ce8ab3a29aac5244a002793b41f7f45ce940894f42be71c0e47ec50d0e264634'
    'b7941099d70483350c3f1af82bdf55cda68203f12f2e8a9b09b23749de3a5caf'
)
options=("!strip")

package() {
    cd azaharplus-$_pkgver-linux
    install -Dm 755 azahar.AppImage $pkgdir/usr/bin/azahar
    install -Dm 755 azahar-room.AppImage $pkgdir/usr/bin/azahar-room
    install -Dm 755 scripting/citra.py -t $pkgdir/usr/bin
    install -Dm 644 $srcdir/azaharplus.desktop -t $pkgdir/usr/share/applications
    install -Dm 644 $srcdir/azahar.svg -t $pkgdir/usr/share/pixmaps
}

