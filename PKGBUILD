pkgname=rutile-bin
pkgver=0.10.0
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
b2sums=(b3a7ad8310c21b3189528c90757828417bc19f088a1e1e42ce900a65dd1557b1f54202e246b62a20b4c39bbccb6c171ca0c6ec16c669ff48fb24025b2345d6b1)
b2sums_x86_64=(9cead3c9188d1bb9b9272e68ffb7c9aea661dea5fb9a3caa3c11c3b7732a85c76d5cdc12ba47b269b00eefe784c24a1dc0f2331b75545fecaf4c37a9a6f56783)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
