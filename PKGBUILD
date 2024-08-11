# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="mandarine-appimage"
pkgver=1.0
pkgrel=1
_date='20240806'
_hash='a22d894'
pkgdesc='3ds emulator - citra fork with tweaks/enhancements'
url='https://github.com/mandarine3ds/mandarine'
license=("GPL-2.0")
arch=("x86_64")
provides=("mandarine")
conflicts=('mandarine' 'mandarine-git')
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/mandarine3ds/mandarine/releases/download/r1.0/mandarine-linux-appimage-20240806-a22d894.tar.gz"
        "https://raw.githubusercontent.com/mandarine3ds/mandarine/master/dist/mandarine-qt.desktop")
b2sums=('ce3157363c0a103b7a6180c928b95ccbeceb0df67a87a68b2898eabcc88b6306cb476040b74b952910d2fa9b75c01869b9693a65338fc62a8e9302b84bc5b966'
        '40f02263d45ab7e78be042e6b7d2fa05bedd12563853f57250089e0e0001f6192e5e7e7a9bac174c4c81581a92d8951be10388c4b219f8f27c0b91f4e35fd5bb')
options=("!strip")

package(){
 cd "mandarine-linux-appimage-$_date-$_hash"
 install -D -m 755 "mandarine.AppImage"       "$pkgdir/usr/bin/mandarine"
 install -D -m 755 "mandarine-room.AppImage"  "$pkgdir/usr/bin/mandarine-room"
 install -D -m 755 "mandarine-qt.AppImage"    "$pkgdir/usr/bin/mandarine-qt"
 install -D -m 755 "scripting/mandarine.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/mandarine.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/mandarine-qt.desktop" -t "$pkgdir/usr/share/applications"
}

