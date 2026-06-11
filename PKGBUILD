pkgname=omniglyph
pkgver=1.0.0
pkgrel=3
pkgdesc="Emoji and Unicode symbol picker"
arch=('x86_64')
url="https://github.com/pshycodr/omniglyph"
license=('GPL-3.0-only')

conflicts=('omniglyph')
provides=('omniglyph')

options=('!strip' '!debug')

depends=(
    gtk4
    libadwaita
)

source=(
    "omniglyph::https://github.com/pshycodr/omniglyph/releases/download/v$pkgver/omniglyph.bin"
    'dev.anishroy.omniglyph.desktop'
    'omniglyph.png'
)

sha256sums=('79f49372d01c4f139385548c96171de67170b3b8c9d11ab8e68411827a8b3437'
            'eecfaa0ae40f3afd050d237bf2af3d0e7c4d3eb3c6ccbdd490fd085d4e5670d1'
            '13acc509f7dbe1f80885c0f260d2b3f87da2706a9437d68335d44cd27bdcaa18')

package() {
    install -Dm755 \
        "$srcdir/omniglyph" \
        "$pkgdir/usr/bin/omniglyph"

    install -Dm644 \
        "$srcdir/dev.anishroy.omniglyph.desktop" \
        "$pkgdir/usr/share/applications/dev.anishroy.omniglyph.desktop"

    install -Dm644 \
        "$srcdir/omniglyph.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.anishroy.omniglyph.png"
}
