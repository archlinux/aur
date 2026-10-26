# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="mandarine-appimage"
pkgver=1.3.0
pkgrel=1
_date='20260415'
_hash='3f023d0'
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
        "https://raw.githubusercontent.com/mandarine3ds/mandarine/master/dist/mandarine.desktop")
b2sums=('3aa25183969a39f505fbfb21aebc9d4b57ff69efa141cfd778a110cca73aaa37149f067d0b47cd573f932cedf2c802015b6527ef779e83061179a6f73b092e02'
        'a41dbe7aa2f2f036eefb5abba40f98e17e0643be27b7ee3df582fef308774f0de29ccada022ecfea591ff447d5a9e525f8c5fb3e5b2fbc90c43722f9fa770b92')
options=("!strip")

package(){
 cd "mandarine-linux-appimage-$_date-$_hash"
 install -D -m 755 "mandarine.AppImage"       "$pkgdir/usr/bin/mandarine"
 install -D -m 755 "mandarine-room.AppImage"  "$pkgdir/usr/bin/mandarine-room"
 install -D -m 755 "mandarine.AppImage"    "$pkgdir/usr/bin/mandarine"
 install -D -m 755 "scripting/mandarine.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/mandarine.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/mandarine.desktop" -t "$pkgdir/usr/share/applications"
}

