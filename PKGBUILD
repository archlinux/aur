# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-neutronhpdata
_dataname="G4NDL"
pkgver=4.6
pkgrel=2
pkgdesc="Neutron data files with thermal cross sections"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.06')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('9d287cf2ae0fb887a2adce801ee74fb9be21b0d166dab49bcbee9408a5145408'
            '708b99a1e63fedf9cb2f735512cefcf5a3b7fb58a82feeb0fdfe8d8906df61e0')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
