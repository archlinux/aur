# Maintainer: zuki18 <zukirust at gmail dot com>
# Contributor: AlphaJack <alphajack at tuta dot io> 
# Copied and used the "citra-appimage" pkg made by AlphaJack as a base

pkgname="lime3ds-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/Lime3DS/Lime3DS/releases
#       3. copy version number to pkgver
pkgver=2112
pkgrel=2
epoch=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://lime3ds.github.io/"
license=("GPL2")
arch=("x86_64")
provides=("lime3ds")
conflicts=()
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/Lime3DS/Lime3DS/releases/download/$pkgver/lime3ds-$pkgver-linux-appimage.tar.gz"
        "lime3ds.desktop")
b2sums=('d83ea3eaa1ce2b8413af7e1925b348eb13cf0137d6edc4cb32953a9359467f5aec56d69c9a795e19a387cd69ac9018f635e906490fbd24433abb20f7ee914a1c'
        'be5cbb996af3fdd28b955d3a32171138a696753edd73d5d7b4de645f22f4e49bb5b51dab12309962189ac32d0913dde1dc9f15f50437ee2f621803a6b1e0edd4')
options=("!strip")

package(){
 cd "lime3ds-$pkgver-linux-appimage"
 install -D -m 755 "lime3ds-cli.AppImage"       "$pkgdir/usr/bin/lime3ds-cli"
 install -D -m 755 "lime3ds-room.AppImage"  "$pkgdir/usr/bin/lime3ds-room"
 install -D -m 755 "lime3ds-gui.AppImage"    "$pkgdir/usr/bin/lime3ds-gui"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/lime.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/lime3ds.desktop" -t "$pkgdir/usr/share/applications"
}

