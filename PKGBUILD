# Maintainer: Simone Scalabrino <simone.scalabrino@unimol.it>
# Developer: Team Molise
# Made with ❤️ in Molise

pkgname=eyesleep
pkgver=1.0
_dlver=${pkgver//./-}
pkgrel=1
pkgdesc="Rest your eyes using the 20-20-20 rule"
arch=('any')
url="https://github.com/intersimone999/eyesleep"
license=('GPL')
depends=('java-environment')
makedepends=()
source=(https://github.com/intersimone999/eyesleep/releases/download/v1.0/Eyesleep.aur.zip)
noextract=()
md5sums=()
validpgpkeys=()

md5sums=('b88ea45647814e6c83af2836a94a62fe')
build() {
    cd $srcdir
}
package() {
  cd $srcdir

  # install jar file
  mkdir -p $pkgdir/usr/share/java/$pkgname
  install -m644 Eyesleep.jar $pkgdir/usr/share/java/$pkgname/Eyesleep.jar

  # setup for freedesktop icons and shell script
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  mkdir -p $pkgdir/usr/bin
  install -m644 eyesleep.png $pkgdir/usr/share/pixmaps/eyesleep.png
  install -m644 eyesleep.desktop $pkgdir/usr/share/applications/eyesleep.desktop
  install -m755 eyesleep.sh $pkgdir/usr/bin/eyesleep
}
