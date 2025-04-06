# Maintainer: Sunny <brainworms2002 at gmail dot com>

pkgname="azahar-appimage"

# to update automatically:
#       1. run makepkg
#_url="$(curl -s "https://api.github.com/repos/azahar-emu/azahar/releases/latest" | jq -r '.assets[].browser_download_url | select(test("citra-linux-appimage.*tar.gz"))')"
pkgver=2120.2

pkgrel=1
epoch=1
pkgdesc="Azahar is an open-source 3DS emulator project based on Citra. (already compiled)"
url="https://azahar-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("azahar")
conflicts=("azahar"
	   "azahar-git")
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/azahar-emu/azahar/releases/download/$pkgver/azahar-$pkgver-linux-appimage.tar.gz"
        "azahar.desktop")
sha256sums=('5b273e302b56fa4ffadfdf37cc883e3619e359f557c7040656c87c01324f3af4'
            '2550dd1eac11f3d0cd8465f65b6a948b0633e97cc58f27c2847fcd9efc73e650')
options=("!strip")

package(){
 cd "azahar-$pkgver-linux-appimage"
 install -D -m 755 "azahar-room.AppImage"  "$pkgdir/usr/bin/azahar-room"
 install -D -m 755 "azahar.AppImage"    "$pkgdir/usr/bin/azahar"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/azahar.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/azahar.desktop" -t "$pkgdir/usr/share/applications"
}
