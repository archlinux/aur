# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="lime3ds-appimage"
pkgver=2118.1
pkgrel=1
epoch=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, AppImage version"
url="https://lime3ds.github.io/"
license=("GPL2")
arch=("x86_64")
provides=("lime3ds")
conflicts=('lime3ds-git' 'lime3ds')
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/Lime3DS/Lime3DS/releases/download/$pkgver/lime3ds-$pkgver-linux-appimage.tar.gz"
        "https://raw.githubusercontent.com/Lime3DS/Lime3DS/master/dist/lime3ds.desktop")
b2sums=('b37dbd74ba5465113b5e1b9faebd1d49e56c89edc1b120c976b8d0ca6464181260d9573c5907b1cd70e793c99cd46f5f04e156f1c4e1e67ac1110134c826a153'
        '1dc8ad96f6efbcc638d8fa4cc2c203920f6a6930592a8532caa519a9cef3ff99378366b083e21ec96381461dd792d7a042bae949bb25aee6c13b030dfe636984')
options=("!strip")

package(){
 cd "lime3ds-$pkgver-linux-appimage"
 install -D -m 755 "lime3ds-room.AppImage"  "$pkgdir/usr/bin/lime3ds-room"
 install -D -m 755 "lime3ds.AppImage"    "$pkgdir/usr/bin/lime3ds"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/lime.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/lime3ds.desktop" -t "$pkgdir/usr/share/applications"
}

