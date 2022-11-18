# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=gant-icon-theme
pkgver=1.2
pkgrel=1
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/G-A-N-T-3035321"
license=('cc-by-nc-sa')

source=("$pkgname-$pkgver.tar.gz::https://github.com/robson-66/Gant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a103b9f0dbf797eae203313bcd25bf16958451986fe64d5c963db85f35feef30')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/Gant*/ "$pkgdir"/usr/share/icons/Gant/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}