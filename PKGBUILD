# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/PabloMK7/citra/releases
#       3. copy release date to $pkgver
#       4. copy commit to $_commit
pkgver=20240406
_commit=0c2f076
pkgrel=1
epoch=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://citra-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("citra")
conflicts=("citra-bin"
           "citra-git"
           "citra-canary-bin"
           "citra-canary-git"
           "citra-qt-git"
           "citra-qt-canary-bin"
           "citra-qt-bin")
replaces=("citra-bin"
          "citra-qt-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/PabloMK7/citra/releases/download/r$_commit/citra-linux-appimage-$pkgver-$_commit.tar.gz"
        "citra.desktop")
b2sums=('dcf2475a4f7f4eef50a4bc807bc98b53b139860beaf3dbfee1d973fc191279d7f54e0d42a307c530f8318898d4134f107f79e2d88da4dcc3c94c8d338aff2bd3'
        '1c12c015380367b599cb56cabfdcf9065e2cbb04e3145d0dcfdfc5e2cb404926c2851e58383c930f569b67da8f89095164b7d1f482f39fb5e1f5a1c26e1853b0')
options=("!strip")

package(){
 cd "citra-linux-appimage-$pkgver-$_commit"
 install -D -m 755 "citra.AppImage"       "$pkgdir/usr/bin/citra"
 install -D -m 755 "citra-room.AppImage"  "$pkgdir/usr/bin/citra-room"
 install -D -m 755 "citra-qt.AppImage"    "$pkgdir/usr/bin/citra-qt"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/citra.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/citra.desktop" -t "$pkgdir/usr/share/applications"
}

