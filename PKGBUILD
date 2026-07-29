pkgname=rutile-bin
pkgver=0.5.0
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
b2sums=(a8f9304e15bf38ca1262c9aa5d0fe083518cc57139c9b57177b567334c707b11bfb680b5a93c278d15384a3270f065d03c7c364a4e65804d967ad2628dd75a30)
b2sums_x86_64=(5bee50bdcd78d6b98c731921ab36078167625f3246077f53462a3d5881007eebfcec9a21b2b16f221b730e894bdd78033307bfe5fdf7b506839e5ffdb98f121a)

package() {
    install -Dm0755 "rutile-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/rutile"
    install -Dm0644 "Rutile-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "Rutile-${pkgver}/resources/rutile.desktop" "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 "Rutile-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
