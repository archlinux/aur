# Maintainer: M0Rf30

pkgname=hotpotatoes
pkgver=6.1
pkgrel=4
pkgdesc="The Hot Potatoes Suite"
arch=('i686' 'x86_64')
url="http://hotpot.uvic.ca/index.php"
license=('custom')
depends=('java-runtime-headless')
source=("http://hotpot.uvic.ca/javahotpot61.zip"
	256.png
	hotpotatoes.desktop
	hotpotatoes)

package() {
  cd $srcdir
  msg "Starting..."
  mkdir $pkgdir/opt
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp -r javahotpot  $pkgdir/opt/$pkgname
  cp javahotpot/JavaHotPotatoes6.app/Contents/Resources/Java/hotpot6.jar $pkgdir/opt/$pkgname/
  mkdir -p $pkgdir/usr/bin 
  cp $pkgname $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/$pkgname
  rm -r $pkgdir/opt/$pkgname/JavaHotPotatoes6.app
  cp 256.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp $pkgname.desktop $pkgdir/usr/share/applications
} 

md5sums=('3fe77c129296c46c239d9cc0258d36fd'
         'c1929d08080a72e0b814d6a763bac959'
         '9265aee30c90f0f5502d2c0b8cd58904'
         '24d5b1b945fb775bdd5b162894973b40')
