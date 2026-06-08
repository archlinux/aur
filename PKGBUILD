pkgname=omniglyph
pkgver=0.1.0
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
    'omniglyph.desktop'
    'omniglyph.png'
)

sha256sums=('bb577ecd39f50679d6c3db2d656278f3ab00df5c6d52301eda62bb4a910acea4'
            '1979705fdadc29cf978eb739a3b814360e0c2f5eb470e6896ee346c6aaa67b63'
            '13acc509f7dbe1f80885c0f260d2b3f87da2706a9437d68335d44cd27bdcaa18')

package() {
    install -Dm755 \
        "$srcdir/omniglyph" \
        "$pkgdir/usr/bin/omniglyph"

    install -Dm644 \
        "$srcdir/omniglyph.desktop" \
        "$pkgdir/usr/share/applications/omniglyph.desktop"

    install -Dm644 \
        "$srcdir/omniglyph.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/omniglyph.png"
}
