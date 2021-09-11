# Maintainer: Usama <usama DOT cit AT gmail DOT com>

pkgname=zekr
pkgver=1.1.0
pkgrel=2
pkgdesc="Quranic Research Tool"
url="https://sourceforge.net/projects/zekr-linux"
license=("GPL")
arch=('x86_64')
depends=('java-runtime' 'webkitgtk2')

source=(http://downloads.sourceforge.net/$pkgname-linux/$pkgname-$pkgver-linux_64.tar.gz $pkgname.desktop)
sha256sums=(
  "b37482c511697b4bfa3e13a3b63346463ee1dae8db7ac1867a8b91daed9cca27"
  "59ed0e24bc4d2ee7005b2c24c6fe81202c2388e489da9db2851d2cdb6052095a"
)

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/java/$pkgname
  cp -r $srcdir/$pkgname $pkgdir/usr/share/java/
  sed -i 's|DIR_NAME=`dirname $0`|DIR_NAME=/usr/share/java/zekr|' $srcdir/$pkgname/zekr.sh
  rm $pkgdir/usr/share/java/zekr/zekr.sh
  install -D -m755 $srcdir/$pkgname/zekr.sh $pkgdir/usr/bin/$pkgname.sh
  mkdir -p $pkgdir/usr/share/pixmaps
  install -D -m644 $srcdir/$pkgname/res/image/icon/open-book-128.png $pkgdir/usr/share/pixmaps/$pkgname.png
  mkdir -p $pkgdir/usr/share/applications
}
