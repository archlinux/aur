# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-shabnam
pkgver=0.9.1
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/shabnam-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/shabnam-font/releases/download/v$pkgver/shabnam-font-v$pkgver.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('5ea85651b30a1395b8a619013d6cc8ba')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/shabnam*
  install -Dm 644 $srcdir/$pkgname/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
