pkgname=rutile-bin
pkgver=0.14.0
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
b2sums=(9f43842b97ef8d122307e54b61dfb071cbe595aa054c921bf8ba31b352eb29dee16e2603efa03816a3f1d7a31d60f650a21167856fc39cf718521007818bda43)
b2sums_x86_64=(c42ea070fb1800f99fc69cc0e8091d56513a744f087510e61a16529234fd1b214451e09379de24bb1eb0a452c05b33876662d45a801c903504bd3203b16ee5d1)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
