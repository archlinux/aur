pkgname=omniglyph
pkgver=1.1.0
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

sha256sums=('3fd77b92385b87115e53670a7ee87b6e89eb45a82d88b57c349556eceb1b0b03'
            '3e6895c1da0ea0c1816aee75202a3a8e8467db334dddd3274b54dc4e5ea593f9'
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
