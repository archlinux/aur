# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="lime3ds-appimage"
pkgver=2118
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
        "https://raw.githubusercontent.com/Lime3DS/Lime3DS/master/dist/lime3ds-gui.desktop")
b2sums=('f4ead1a8e03456e37bb92dffd135375f3908b0630bca5fb4b3d32ec39984e0d4d531cc92ceb14da99f693ac8c9871f5a32e4e4e5127075be1ea67f2fdf84e67b'
        'be5cbb996af3fdd28b955d3a32171138a696753edd73d5d7b4de645f22f4e49bb5b51dab12309962189ac32d0913dde1dc9f15f50437ee2f621803a6b1e0edd4')
options=("!strip")

package(){
 cd "lime3ds-$pkgver-linux-appimage"
 install -D -m 755 "lime3ds-cli.AppImage"       "$pkgdir/usr/bin/lime3ds-cli"
 install -D -m 755 "lime3ds-room.AppImage"  "$pkgdir/usr/bin/lime3ds-room"
 install -D -m 755 "lime3ds-gui.AppImage"    "$pkgdir/usr/bin/lime3ds-gui"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/lime.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/lime3ds-gui.desktop" -t "$pkgdir/usr/share/applications"
}

