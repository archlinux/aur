pkgname=halflife
_pkgname=HalfLife
pkgver=1.0.0
pkgrel=1
pkgdesc="Half Life powered by the xash3d-fwgs engine. NOTE: You will need to own the game so it can import the game files from your Half Life game file. "
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('xash3d-fwgs-bin' 'wget' 'unzip' 'yad' 'zenity')
makedepends=('unzip')
url="https://gitlab.com/half-life1"
source=("https://gitlab.com/half-life1/halflife/-/archive/$pkgver/halflife-$pkgver.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    cp -r "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/games/$_pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
