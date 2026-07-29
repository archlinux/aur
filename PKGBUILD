pkgname=rutile-bin
pkgver=0.4.0
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
b2sums=(a679c3cc2b4e2ddb7aca4f126f3fffa6085b665b0fe038b4c6f27c97de3f688b4d19b11da8d58f6fd2fd53fd25d14b36a23cf84f9fd6f04f4bb4b636e32b0cab)
b2sums_x86_64=(78cd8f235d8acd8978c63e4aee2c10ab9d728f918a71c91893b028fd831dc68511829f82e23590e342dd94ffd2cb2a2dcec51b595b66b82cfa89612f03e82086)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
