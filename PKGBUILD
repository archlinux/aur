# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
pkgver="20240927"
_commit="608383e"
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
source=("https://archive.org/download/citra-emulator-pablomk7-fork/git/r$_commit/citra-linux-appimage-$pkgver-$_commit.tar.gz"
        "citra.desktop")
b2sums=('74d037791de0d37124d6064e698f30f7b1a13d0b6f3fdc391d0bba97fbe1b0501719fdaef09f8550961c79b5b3e0d28e6cd07e95ef55ebf6a669e22a506578c2'
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

