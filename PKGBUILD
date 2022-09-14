# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=buuf-xfce4-weather
pkgver=1.1
pkgrel=0
pkgdesc="Xfce4 weather plugin Buuf icons theme"
arch=('any')
url="https://github.com/robson-66/Buuf-xfce4-weather"
license=('cc-by-nc-sa')
depends=('xfce4-weather-plugin')

source=("https://github.com/robson-66/Buuf-xfce4-weather/archive/refs/tags/v1.1.tar.gz")
sha256sums=('d2de8696ae80cf33a581886233effa885e579f0cdbd6615fad08d32e3b89fb26')

package() {
  mkdir -p "$pkgdir"/usr/share/xfce4/weather/icons/
  cp -R "$srcdir"/Buuf-xfce4-weather*/ "$pkgdir"/usr/share/xfce4/weather/icons/buuf/
  
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}
