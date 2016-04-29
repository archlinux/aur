# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-samim
pkgver=0.10.3
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/samim-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::https://github.com/rastikerdar/samim-font/releases/download/v$pkgver/samim-font-v$pkgver.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('8b0c3556c2984b98444cf153ba28ca3e')

prepare() {
  unzip -o -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/samim*
  install -Dm 644 $srcdir/$pkgname/license $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
