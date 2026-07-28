pkgname=rutile-bin
pkgver=0.3.0
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
b2sums=(7f672a378a735f17a7ec1a2b81994db31b1a1d30f261eb609a4665653ed8e7707b2fe1f1122b6294097d06469a17e6abe9e3f09492905fd42c0e524c960f154b)
b2sums_x86_64=(89f4624453e5140e8ae2c5920a44d10d6889ebc4212441463b15914f1e798d3c85b81d10c7b72966bb4a3ed9654cfa1003021123f23e2d1a9c84b40d47df82e6)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
