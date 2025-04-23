# Maintainer: aquova <mail at aquova dot net>

pkgname="azaharplus-appimage"
pkgver=2120_2_C
_pkgver=2120.2-C
pkgrel=1
pkgdesc="A fork of the Azahar 3DS emulator that restores some features"
arch=("x86_64")
url="https://github.com/AzaharPlus/AzaharPlus"
license=("GPL2")
provides=("azahar" "azaharplus")
conflicts=("azahar" "azaharplus")
depends=(ffmpeg sdl2)
source=(
    "$url/releases/download/AZAHARPLUS_${pkgver}/azaharplus-${_pkgver}-linux.zip"
    azaharplus.desktop
)
sha256sums=(
    'ba00b1cd2bbd11cbc2fc5272dae1019358e4bf4d7520e465df4340b3f60ea4f5'
    'ce8ab3a29aac5244a002793b41f7f45ce940894f42be71c0e47ec50d0e264634'
)
options=("!strip")

package() {
    cd azaharplus-$_pkgver-linux
    install -Dm 755 azahar.AppImage $pkgdir/usr/bin/azahar
    install -Dm 755 azahar-room.AppImage $pkgdir/usr/bin/azahar-room
    install -Dm 755 scripting/citra.py -t $pkgdir/usr/bin
    install -Dm 644 dist/azahar.png -t $pkgdir/usr/share/pixmaps
    install -Dm 644 $srcdir/azaharplus.desktop -t $pkgdir/usr/share/applications
}

