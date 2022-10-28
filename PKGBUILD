# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=gant-icon-theme
pkgver=1.1
pkgrel=0
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/G-A-N-T-3035321"
license=('cc-by-nc-sa')

source=("$pkgname-$pkgver.tar.gz::https://github.com/robson-66/Gant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e6dab5d13f7f370c1f723f8c46e1ac40e29c350e1237b98b67635f8ecca1c9b')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/Gant*/ "$pkgdir"/usr/share/icons/Gant/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}