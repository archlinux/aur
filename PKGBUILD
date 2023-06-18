# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/citra-emu/citra-nightly/releases
#       3. copy release to $pkgver
#       4. copy date-commit to $_ref
_ref=20230617-06db4ff
pkgver=1923
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://citra-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("citra")
# my old + other previous packages
conflicts=("citra-bin"
           "citra-git"
           "citra-canary-bin"
           "citra-canary-git"
           "citra-qt-git"
           "citra-qt-canary-bin"
           "citra-qt-bin")
# my old packages
replaces=( "citra-bin"
           "citra-qt-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/citra-emu/citra-nightly/releases/download/nightly-$pkgver/citra-linux-$_ref.AppImage"
        "citra.desktop"
        "citra.png")
sha256sums=('5adfea30a42071cd37ece80a185613899dc4336b2eeeb092701fdbed0da41bee'
            'f389a9faf36477fdccd50713be90bb10e2fa5ff21b8af5a7020da59ff5e8921c'
            '62eb289bd3be94d087e22aad9330fca40dcf9608d3a2d10973453a5991882d83')
options=("!strip")

package(){
 install -D -m 755 "citra-linux-$_ref.AppImage" "$pkgdir/usr/bin/citra-appimage"
 install -D -m 644 "citra.desktop" "$pkgdir/usr/share/applications/citra.desktop"
 install -D -m 644 "citra.png" "${pkgdir}/usr/share/pixmaps/citra.png"
}

