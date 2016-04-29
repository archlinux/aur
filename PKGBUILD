# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-tanha
pkgver=0.3
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/tanha-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/tanha-font/archive/master.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('a4672c558161f89a4ae84b1f9fe151eb')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/tanha-font-master/tanha*
  install -Dm 644 $srcdir/$pkgname/tanha-font-master/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
