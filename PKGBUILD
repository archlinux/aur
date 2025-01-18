pkgname=perfectdark
_pkgname=PerfectDark
pkgver=1.0.1
pkgrel=1
pkgdesc="Perfect Dark powered by perfect_dark reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/perfectdark"
license=('GPL')
depends=('pd-bin')
makedepends=('unzip')
sha256sums=('4b534f80627befa2085f2d0f36e74b2ac4f30f39392e2f7b9528fc1ececc8083')
source=("https://gitlab.com/linuxbombay/perfectdark/perfectdark/-/archive/$pkgver/perfectdark-$pkgver.tar.bz2")

package() {
   install -dm755 "$pkgdir/usr/share/games/$_pkgname"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   install -dm755 "$pkgdir/usr/bin"
   
   cp -r "$srcdir/perfectdark-$pkgver/perfectdark.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
   cp -r "$srcdir/perfectdark-$pkgver/." "$pkgdir/usr/share/games/$_pkgname/"
   cp -r "$srcdir/perfectdark-$pkgver/perfectdark" "$pkgdir/usr/bin"

   # Desktop Entry
   install -Dm644 "$srcdir/perfectdark-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
