# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-parastoo
pkgver=0.12
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/parastoo-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/parastoo-font/releases/download/v$pkgver/parastoo-font-v$pkgver.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('7f4c96c2b10a7862ab9ac134019c330c')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/parastoo*
  install -Dm 644 $srcdir/$pkgname/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
