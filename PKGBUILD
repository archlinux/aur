# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=gant-icon-theme
pkgver=1.3
pkgrel=1
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/G-A-N-T-3035321"
license=('cc-by-nc-sa')

source=("$pkgname-$pkgver.tar.gz::https://github.com/robson-66/GANT/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('057e40f0a48ec0e8478a843b67266068f324cc701e7c1e7c77c50d1fcd1be992')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/GANT*/ "$pkgdir"/usr/share/icons/Gant/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}