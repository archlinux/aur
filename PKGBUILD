# Maintainer: zuki18 <zukirust at gmail dot com>
# Contributor: AlphaJack <alphajack at tuta dot io> 
# Copied and used the "citra-appimage" pkg made by AlphaJack as a base

pkgname="lime3ds-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/Lime3DS/Lime3DS/releases
#       3. copy version number to pkgver
pkgver=2109
pkgrel=1
epoch=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://lime3ds.github.io/"
license=("GPL2")
arch=("x86_64")
provides=("lime3ds")
conflicts=()
replaces=("citra-bin"
          "citra-qt-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/Lime3DS/Lime3DS/releases/download/$pkgver/lime3ds-$pkgver-linux-appimage.tar.gz"
        "lime3ds.desktop")
b2sums=('09365add4db36d379972e091f3cc1cba6dde1bf1e034ec9aab2f9d61a5ad676f878dea69ae247a3d62743607da8e4171fe9de779e0cfc3c39f72b3cf416524d6'
        'afc63b0ccc3ad90debf3e7aac3c2f6bcb328c15f8f2d4ca13033c1546ffe741858e5297a8ed7c012e63b8420c006dcc76a2cb3075da715ae20c3b6316cdf2abf')
options=("!strip")

package(){
 cd "lime3ds-$pkgver-linux-appimage"
 install -D -m 755 "lime.AppImage"       "$pkgdir/usr/bin/lime3ds"
 install -D -m 755 "lime-room.AppImage"  "$pkgdir/usr/bin/lime-room"
 install -D -m 755 "lime-qt.AppImage"    "$pkgdir/usr/bin/lime-qt"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/lime.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/lime3ds.desktop" -t "$pkgdir/usr/share/applications"
}

