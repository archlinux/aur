# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-sina
pkgver=1.0
pkgrel=1
pkgdesc="Sina Pardazesh persian font series."
arch=('any')
url="http://www.sinapardazesh.ir/"
license=('custom')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::http://www.sinapardazeshsoft.ir/download/Fonts/SinaPack%20fonts.zip")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('65f024cb75402942eded926248f6ad2a')

prepare() {
  unzip -o -j -LL -qq $pkgname.zip -d $srcdir/$pkgname/
  rm "$srcdir/$pkgname/copy of sp_farnaz.ttf"
}
package() {  
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname $srcdir/$pkgname/*.ttf
}
