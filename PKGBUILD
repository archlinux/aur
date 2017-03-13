# Maintainer: Javier Fernández <WyRe12[at]gmail[dot]com>

pkgname=minecrafter-ttf
pkgver=1.0
pkgrel=1
pkgdesc="Minecrafter fonts from http://www.dafont.com"
arch=(any)
url="http://www.dafont.com/es/minecrafter.font"
license=('CCPL')
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("$pkgname.zip::http://dl.dafont.com/dl/?f=minecrafter")
noextract=("$pkgname.zip")
install=$pkgname.install
md5sums=('7b2874b4e67f6a018bba648031cfa6bc')

prepare() {
  unzip -o -j -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}

package() {
  chmod 644 "$srcdir/$pkgname/"*.ttf
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
