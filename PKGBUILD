# Alloy is developed by the Software Design Group at MIT.
# See http://sdg.csail.mit.edu/ or http://alloy.mit.edu
# Maintainer: Ivan Kuraj <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Rodney Price <rod@thirdoption.info>

pkgname="alloy"
pkgver=4.2.5
pkgrel=1
pkgdesc="A lightweight modelling language for software design."
url="http://alloy.mit.edu/alloy/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://alloy.mit.edu/alloy/downloads/alloy4.2_2015-02-22.jar"
        "alloy" "alloy.png" "alloy.desktop")
md5sums=('de970bf9dad3819532422629b48ae296'
         '51313a5e566f50ef580231d7e3596d1d'
         'e117c6a2bb28826e9307cbf094e980ab'
         '3ad162df79191af3509afe9e232b1269')

package() {
  mkdir -p ${pkgdir}/usr/share/alloy
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
  
  cd ${srcdir}
  install -m 644 -D alloy4.2_2015-02-22.jar ${pkgdir}/usr/share/alloy/alloy4.2.jar
  install -m 755 -D alloy ${pkgdir}/usr/bin/
  # icon
  install -Dm644 alloy.png $pkgdir/usr/share/pixmaps/alloy.png
  # app file desktop
  install -Dm644 alloy.desktop $pkgdir/usr/share/applications/
}
