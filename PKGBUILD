# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-borna
pkgver=1.0
pkgrel=2
pkgdesc="Borna Rayaneh Persian B font series."
arch=('any')
url="http://www.bornaray.com/products/font.html"
license=('GPL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::http://www.bornaray.com/downloads/bfonts.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('e21a18bd572bc551ad9728059ec5f0e5')

prepare() {
  unzip -o -j -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/*.ttf
}
