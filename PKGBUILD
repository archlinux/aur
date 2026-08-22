# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=pluto-sm64-bin
pkgver=1.2
pkgrel=1
pkgdesc="Pluto is an all-in-one machinima studio, forked from sm64coopdx 0.2 by the Coop Deluxe team."
url='https://github.com/Llennpie/Pluto'
arch=('x86_64')
depends=('sdl2-compat' 'glew')
source=("${url}/releases/download/${pkgver}/linux.zip"
  'pluto-sm64.desktop' 'pluto-sm64.png' 'pluto-sm64'
)
sha256sums=(
  'SKIP'
  'ddc89d9767fd2843815a8acfb87617106337c0bd267d8ea000a1d49cadde0308'
  '3502e5f6427294a8b85f0a2ff5621005638ffdc794f7516363001bb1021cefa5'
  'b649cdc55a144a1884db2aa578cad4fa7e67c12868a8ce80c89a1aa2c96927c1'
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pluto-sm64"
    cp -r \
        "$srcdir/dynos" \
        "$srcdir/mods" \
        "$srcdir/lang" \
        "$srcdir/libdiscord_game_sdk.so" \
        "$srcdir/libbass.so" \
        "$srcdir/libbass_fx.so" \
        "$srcdir/Panimotion.mp3" \
        "$srcdir/sm64coopdx" \
        "$pkgdir/usr/share/pluto-sm64"
    cp "$srcdir/pluto-sm64.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    cp "$srcdir/pluto-sm64.desktop" "$pkgdir/usr/share/applications"
    cp "$srcdir/pluto-sm64" "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/pluto-sm64"
}