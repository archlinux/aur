pkgname=rutile-bin
pkgver=0.2.1
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
b2sums=(e7bd8aff091f069c945cdb496fa96f8fc0c7446f01f2f272fbe9ed85a510c8b129898350af6b93c6616b9bb37d3fd23d1cf37a4029c5936a6ea9497b2e36484a)
b2sums_x86_64=(3d0988fc738ef3b0a4c22bcb36b1896f459ef0491c8ba4ab8f001dd886a4bbf607ce162e12a7abd07b6c46931e99337b0534eb78e3c04a9a296f3da14dd361fc)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
