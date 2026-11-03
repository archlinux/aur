pkgname=rutile-bin
pkgver=0.8.0
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
b2sums=(01ab7ad899cbfc2338ccb5e9bf9d81518b962e3e397d7428d85d75cb15bbb3bf2163c12654bec2fb831c3b5270d65d8e723c8cca1a67d5d18d868b5ce1e162dc)
b2sums_x86_64=(df3b1eeb420b169db65c9e0b7b0f3fcfedbb83737e027fdc030982b87cffa2c6d63e5f62701b03c58868128130b5852dcef1a5062e7be28a49beea5470dccc73)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
