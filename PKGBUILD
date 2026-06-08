pkgname=omniglyph
pkgver=0.1.1
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

sha256sums=('e0671a72878b66348109572c087b9fe1b9b152cfa8b7c2164597b0523fcaf6a8'
            'c8090776b31e39fc1c6ee6af05f4778f64f4e312e61d57bdb864f684e0dbeb41'
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
