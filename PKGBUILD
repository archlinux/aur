# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-gandom
pkgver=0.3
pkgrel=2
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/gandom-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/gandom-font/releases/download/v$pkgver/gandom-font-v$pkgver.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('0b30950c5bf6baa9fd363cd0059f1f9c')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/gandom*
  install -Dm 644 $srcdir/$pkgname/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
