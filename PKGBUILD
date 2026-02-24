pkgname=orangcalc-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Orange Calculator"
arch=('x86_64')
url="https://oranges.lt"
license=('MIT')
provides=('orangcalc')
conflicts=('orangcalc')
options=('!strip')

source=(
    "https://github.com/Orang-Studio/OrangCalc/releases/download/3.0/orangcalc.bin"
    "orangcalc.desktop"
    "orange.png"
    "LICENSE"
)

sha256sums=(
    '4d65acc77a7c1969527cb7915bc38f2daeef2ac51bf4c09a58e02c7fb4ac4201'
    'c404c2669fa3b01b08460e7aec5893ecf9284e14269cfd035cd581e27c4e66b9'
    'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968'
    '3c8133c78d2e468f22643e465f8abcf4404742dc1b80c5eb64742039d70c5afa'
)

package() {
    install -d "$pkgdir/usr/bin" install -d "$pkgdir/usr/share/applications" 
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps" 
    install -Dm755 "$srcdir/orangcalc.bin" "$pkgdir/usr/bin/orangcalc"
    install -Dm644 "$srcdir/orangcalc.desktop" "$pkgdir/usr/share/applications/orangcalc.desktop"
    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/orangcalc.png"
    sed -i "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/orangcalc.png|g" "$pkgdir/usr/share/applications/orangcalc.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/orangcalc.bin" "$pkgdir/usr/bin/orangcalc.bin" 
    sed -i "s|Exec=.*|Exec=/usr/bin/orangcalc|g" "$pkgdir/usr/share/applications/orangcalc.desktop" 
}