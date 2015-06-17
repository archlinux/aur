# Maintainer: M0Rf30

pkgname=mars-mips
pkgver=4.5
_ver=${pkgver%.*}_${pkgver#*.}
pkgrel=1
pkgdesc="An IDE for programming in MIPS assembly language intended for educational-level use"
arch=('any')
url="http://courses.missouristate.edu/KenVollmar/MARS/index.htm"
license=('MIT')
depends=('java-runtime')
noextract=('Mars${_ver}.jar')
install="${pkgname}.install"
source=(http://courses.missouristate.edu/KenVollmar/MARS/MARS_${_ver}_Aug2014/Mars${_ver}.jar
	mars-mips
	mars.png
	mars.desktop)

package() {
  mkdir -p $pkgdir/usr/share/java/$pkgname
  cp $srcdir/*.jar $pkgdir/usr/share/java/$pkgname/Mars.jar
  install -Dm755 $srcdir/mars-mips "$pkgdir"/usr/bin/mars-mips 
  install -Dm644 $srcdir/mars.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/mars.png
  install -Dm644 $srcdir/mars.desktop "$pkgdir"/usr/share/applications/mars.desktop
}

md5sums=('4709fae736e6c9d4078ea4b21e0be1e9'
         'd7e664dcebde337e0b94a3aafb351fb8'
         '6a74c887b0166d4adb5b06c64d6a444b'
         '83281c7998223ff073bb31efd473275c')
