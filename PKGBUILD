pkgname=deepin-gtk-theme
pkgver=20131205094859~95cd257c48
_realver=13.06+git$pkgver
pkgrel=1
pkgdesc="Deepin GTK Theme."
arch=('any')
url="http://www.linuxdeepin.com"
license=('LGPL-3+')
depends=('gtk3' 'lib32-glibc')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/$pkgname/${pkgname}_${_realver}.tar.gz")
sha256sums=('f11748d3dd875a4653541bd5638682298f2370d715adc4afd9d5ffc7338b048f')

package() {
  cd "$srcdir"/$pkgname-${_realver}
  
  mkdir -p "$pkgdir/usr/share/themes"
  cp -rf Deepin "$pkgdir/usr/share/themes/Deepin-Legacy"
  cp -rf Deepin-Dark "$pkgdir/usr/share/themes/Deepin"
  cp -rf Deepin-Fasion "$pkgdir/usr/share/themes/"
  cp -rf Deepin-Gray "$pkgdir/usr/share/themes/"
  
  # Change gtk-theme name
  sed -i 's/Deepin-Dark/Deepin/g' "$pkgdir/usr/share/themes/Deepin/index.theme"
  sed -i 's/Deepin/Deepin-Legacy/g' "$pkgdir/usr/share/themes/Deepin-Legacy/index.theme"
}

