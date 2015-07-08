# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-irfonts
pkgver=1.0
pkgrel=0
pkgdesc="Official I.R. Iran Supreme Council of Information and Communication Technology (SCICT) standard persian fonts series"
arch=('any')
url="http://scict.ir"
license=('custom')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unrar')
source=("$pkgname.rar::http://scict.ir/Portal/File/ShowFile.aspx?ID=8964a122-b392-4261-9dd5-10c1938f0c8a")
noextract=("$pkgname.rar")
install=$pkgname.install
md5sums=('4076624eb538b8f15daf53149a4bd186')

prepare() {
unrar x -cl -inul -y $pkgname.rar $srcdir/
mv $srcdir/"standard irfonts" $srcdir/$pkgname
}

package() {
  chmod 644 "$srcdir/$pkgname/"*.*
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -D "$srcdir/$pkgname/readme.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
