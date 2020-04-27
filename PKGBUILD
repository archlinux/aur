# Alloy is developed by the Software Design Group at MIT.
# See https://sdg.csail.mit.edu/ or http://alloytools.org
# Maintainer: Markus Legner <markus@legner.ch>
# Contributor: Ivan Kuraj <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Rodney Price <rod@thirdoption.info>

pkgname="alloy"
pkgver=5.1.0
pkgrel=1
pkgdesc="A lightweight modelling language for software design."
url="https://alloytools.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/AlloyTools/org.alloytools.alloy/releases/download/v5.1.0/org.alloytools.alloy.dist.jar"
        "alloy" "alloy.png" "alloy.desktop")
md5sums=('bdaaae36f353dbe9bb885364d6e38316'
         '55a6b2408daf2ff9d93bc5bb232d9fc7'
         'e117c6a2bb28826e9307cbf094e980ab'
         '3ad162df79191af3509afe9e232b1269')

package() {
  mkdir -p ${pkgdir}/usr/share/alloy
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
  
  cd ${srcdir}
  install -m 644 -D org.alloytools.alloy.dist.jar ${pkgdir}/usr/share/alloy/alloy5.1.jar
  install -m 755 -D alloy ${pkgdir}/usr/bin/
  # icon
  install -Dm644 alloy.png $pkgdir/usr/share/pixmaps/alloy.png
  # app file desktop
  install -Dm644 alloy.desktop $pkgdir/usr/share/applications/
}
