pkgname=orangcalc-bin
pkgver=3.0.1
pkgrel=2
pkgdesc="Orange Calculator"
arch=('x86_64')
url="https://oranges.lt"
license=('GPL3')
depends=('glibc' 'gtk4' 'gcc-libs')
provides=('orangcalc')
conflicts=('orangcalc')
options=('!strip')

source=(
    "https://github.com/Orang-Studio/OrangCalc/releases/download/4.0-Lin/release.tar.gz"
    "LICENSE"
    "orangcalc.desktop"
    "orange.png"
)

sha256sums=(
    'b8075964c45ab0b8a3cf365f83fb7ba14737cf3bde8f971ef92187e111f7e62e'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
    'd25ffa0c197e61ae6ac5db4ea93a4ece3c9eedbdcd8da21a5f91e35bf6eac7ab'
    'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968'
)

package() {
    install -Dm755 "$srcdir/release/orangcalc" "$pkgdir/usr/bin/orangcalc"
    install -Dm644 "$srcdir/orangcalc.desktop" "$pkgdir/usr/share/applications/orangcalc.desktop"
    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/orangcalc.png"
    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/pixmaps/orangcalc.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
