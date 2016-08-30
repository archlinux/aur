# Contributor: Uwe Hermann <dev@uleenucks.de>

pkgname=raritan-mpc
pkgver=7.0.3.5.62
pkgrel=1
pkgdesc="Standalone multiplatform client for Raritan Dominion KVM-over-IP products"
url="http://www.raritan.com/support/"
license=('custom')
arch=('i686' 'x86_64')

depends=('java-runtime')

options=('!strip')
source=(autoinstall.xml
  http://cdn.raritan.com/download/kxii/v2.7.0/mpc-installer.MPC_${pkgver}.jar.zip
)

build() {
  cd "${srcdir}"
  java -jar "mpc-installer.MPC_${pkgver}.jar" autoinstall.xml
}

package() {
  mkdir -p ${pkgdir}/opt
  mv ${srcdir}/raritan-mpc-7.0.3 ${pkgdir}/opt
}
md5sums=('f32266bacfb02acd778c9619f7f4934e'
         '82e169d048149182fbfc6a569fe147e1')
