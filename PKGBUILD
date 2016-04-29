# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-vazir
pkgver=2_RC13
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/vazir-font/"
license=('custom')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/vazir-font/releases/download/v${pkgver//_/-}/vazir-font-v${pkgver//_/-}.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('a3cf92638dffc7c136e73419a60be194')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/vazir*
  install -Dm 644 $srcdir/$pkgname/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
