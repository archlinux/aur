pkgname=perfectdark
_pkgname=PerfectDark
pkgver=1.0.2
pkgrel=1
pkgdesc="Perfect Dark powered by perfect_dark reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/perfectdark"
license=('GPL')
depends=('pd-bin')
makedepends=('unzip')
sha256sums=('61252ff3a17a9655cf912709339de317025f4cbc9b3cff4408d7bf7974f29fc8')
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
