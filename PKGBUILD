# Maintainer: Artur 'h0m3' Paiva <dr.hoome@gmail.com>
pkgname="protonlaunch"
pkgver="0.9"
pkgrel=1
pkgdesc="A small piece of script to launch Proton directly from the CLI, similar to Wine"
arch=('any')
url="https://github.com/h0m3/protonlaunch"
license=('BSD')
depends=("steam")
optdepends=("steam-native-runtime")
source=("$pkgname::git+https://github.com/h0m3/$pkgname.git#branch=main")
sha256sums=('SKIP')

package() {
    mkdir -pv "$pkgdir/usr/bin"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname/"
    mkdir -pv "$pkgdir/usr/share/doc/$pkgname/"

    mv -v "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    mv -v "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv -v "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    mv -v "$srcdir/$pkgname/screenshot.png" "$pkgdir/usr/share/doc/$pkgname/screenshot.png"

    chmod +x "$pkgdir/usr/bin/$pkgname"
}
