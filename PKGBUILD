# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="mandarine-appimage"
pkgver=1.1
pkgrel=1
_date='20240904'
_hash='d59f2f7'
pkgdesc='3ds emulator - citra fork with tweaks/enhancements'
url='https://github.com/mandarine3ds/mandarine'
license=("GPL-2.0")
arch=("x86_64")
provides=("mandarine")
conflicts=('mandarine' 'mandarine-git')
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/mandarine3ds/mandarine/releases/download/r$pkgver/mandarine-linux-appimage-$_date-$_hash.tar.gz"
        "https://raw.githubusercontent.com/mandarine3ds/mandarine/master/dist/mandarine-qt.desktop")
b2sums=('d591e17668e468de945388bc1b446e324d9a88fb10c9dab1b9dfa284a416b204855fbf1ba2891f1fff05f1e21e73a9f59fb6e89f1bd6f97d74fbed5bd733caa5'
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

