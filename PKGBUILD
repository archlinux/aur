# Maintainer: meanlint <meanlint@outlook.com>
# Contributor: username227 <gfrank227 at gmail dot com>
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="borked3ds-appimage"
pkgver=2025.01.23
pkgrel=1
pkgdesc='An experimental Nintendo 3DS Emulator based off of Citra.'
url='https://github.com/Borked3DS/Borked3DS'
license=("GPL-2.0")
arch=("x86_64")
provides=("borked3ds")
conflicts=('borked3ds')
replaces=()
depends=("sdl3")
source=("https://github.com/Borked3DS/Borked3DS/releases/download/v$pkgver-sdl-compat/borked3ds-v$pkgver-sdl-compat-linux-appimage-gcc-24.04.tar.xz"
        "https://raw.githubusercontent.com/Borked3DS/Borked3DS/refs/heads/master/dist/borked3ds.desktop")
b2sums=('7d766172e0b40402d0fad1159c902f7cb5d4c99851b7e205e8941ddbcdd20207ce5c89e234fe56f4c878beeab2ce259e7c6d35b21089e3c9718a2a02874eb35c'
        '5e64925cea01bf83d5b2fff47fc9bd0198a8fd4dee49becfb88f22ef1f9778eb571006d198e4cf2ca8888cfcf57d3f682fd7efee7c82c06695fcc7e2dd3b65bb')
options=("!strip")

package(){
 cd "borked3ds-v$pkgver-sdl-compat-linux-appimage-gcc-24.04"
 install -D -m 755 "borked3ds.AppImage"       "$pkgdir/usr/bin/borked3ds"
 install -D -m 755 "borked3ds-room.AppImage"  "$pkgdir/usr/bin/borked3ds-room"
 install -D -m 755 "borked3ds.AppImage"    "$pkgdir/usr/bin/borked3ds"
 install -D -m 755 "scripting/borked3ds.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/borked3ds.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/borked3ds.desktop" -t "$pkgdir/usr/share/applications"
}
