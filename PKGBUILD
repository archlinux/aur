pkgname=halflife-xash3d-fwgs
pkgver=1.1
pkgrel=1
pkgdesc="Half Life powered by the xash3d-fwgs engine. NOTE: You will need to own the game so it can import the game files from your Half Life game file. "
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('xash3d-fwgs-bin' 'wget' 'unzip' 'yad' 'zenity')
replaces=('halflife')
conflicts=('halflife')
makedepends=('unzip')
url="https://gitlab.com/half-life1"
source=("https://gitlab.com/linuxbombay/halflife/-/archive/$pkgver/halflife-$pkgver.tar.bz2")
sha256sums=('3014e157aeca013a542976d4bd2305578961bed227f5993974179277adec07f2')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/HalfLife"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    cp -r "$srcdir/halflife-$pkgver/." "$pkgdir/usr/share/games/HalfLife/"
    cp -r "$srcdir/halflife-$pkgver/halflife" "$pkgdir/usr/bin"
    cp -r "$srcdir/halflife-$pkgver/halflife.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/halflife-$pkgver/halflife.desktop" \
    "$pkgdir/usr/share/applications/halflife.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/halflife.desktop"
}
