# Maintainer: aquova <mail at aquova dot net>

pkgname="azaharplus-appimage"
pkgver=2121_1_A
_pkgver=2121.1-A
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
    '12c5da81ecff4873d715565b717ff85493e6db88e20e65ce1c1da5d65d880ccf'
    '1b0842ab57fe3f3e6c989a082d55bcca3042e15a6981bb7e6ce07afcbfca276b'
)
options=("!strip")

package() {
    cd azaharplus-$_pkgver-linux
    install -Dm 755 azahar.AppImage $pkgdir/usr/bin/azahar
    install -Dm 755 azahar-room.AppImage $pkgdir/usr/bin/azahar-room
    install -Dm 755 scripting/citra.py -t $pkgdir/usr/bin
    install -Dm 644 $srcdir/azaharplus.desktop -t $pkgdir/usr/share/applications
}

