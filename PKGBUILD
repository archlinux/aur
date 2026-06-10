pkgname=omniglyph
pkgver=0.1.2
pkgrel=1
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

sha256sums=('ea5f3b7a5544e815ea601038b0856463f1105a8a9b70237d7f8edfc79c9f55ad'
            '7e5ebcc752545e6b16124fd1b1597278a9d1b9c9506229c12775112e73110b1d'
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
