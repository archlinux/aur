# Maintainer: robertfoster

pkgname=mars-mips
pkgver=4.5
_ver=${pkgver%.*}_${pkgver#*.}
pkgrel=6
pkgdesc="An IDE for programming in MIPS assembly language intended for educational-level use"
arch=('any')
url="http://courses.missouristate.edu/KenVollmar/MARS/index.htm"
license=('MIT')
depends=('java-runtime')
noextract=("Mars${_ver}.jar")
install="${pkgname}.install"
source=(
  "https://github.com/M0Rf30/PKGBUILD/releases/download/mars-mips-backup/Mars${_ver}.jar"
  $pkgname.sh
  $pkgname.svg
  "$pkgname.desktop"
)

package() {
  mkdir -p $pkgdir/usr/share/java/$pkgname
  cp $srcdir/*.jar $pkgdir/usr/share/java/$pkgname/Mars.jar
  install -Dm755 $srcdir/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

sha256sums=('ac340b676ba2b62246b9df77e62f81ad4447bcfd329ab539716bcd09950b7096'
  '49e0f7320c332229bbc9c92c35bc0701ea703ab5e3726852b0809c78c2480b51'
  '466bfce86ec1a81886d33f90bd8a98ba785722dedd43cd91e84e510f1feb0a12'
  'c8e926c9c37e01a2f3973ba85b20657905c3b11bcf734bd31864f99ea5555630')
