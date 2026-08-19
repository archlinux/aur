pkgname=rutile-bin
pkgver=0.6.3
pkgrel=1
pkgdesc='GNOME-native terminal emulator with split tiling and synchronized input (pre-built binary)'
url='https://github.com/yatoub/Rutile'
license=('MIT')
depends=('gtk4' 'libadwaita' 'vte4')
arch=('x86_64')
provides=('rutile')
conflicts=('rutile')
source=("https://github.com/yatoub/Rutile/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("rutile-${pkgver}-linux-x86_64::https://github.com/yatoub/Rutile/releases/download/v${pkgver}/rutile-linux-x86_64")
b2sums=(e07732259d3aa985f17bc9e917a5d84740e95e2389ef0cecfa169efbdda4f57b2b653c0351daaa10b2cda1e398f6cbb5cdbd10c01dfa3b26d545a9e9a6e860e4)
b2sums_x86_64=(b1a12b84e7a22824c79b8da24fb2ae69dc0997e118038329e1352e4db1671000517c458e422335973ddee2c8fa82ad594bd20b74bdf20987aa540f0323bd7c8c)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
