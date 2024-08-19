# Maintainer: username227 <gfrank227 at gmail dot com> 
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="lime3ds-appimage"
pkgver=2117.1
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
b2sums=('10440fbe0026094e11fe8afc5df7d6c56812a2d0258f9500364cad106ea97513dc0450ef62d588996421b902f44e2b21c70df4bdb8817ef7a894a6e55ddceae5'
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

