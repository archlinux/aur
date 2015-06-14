# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-neutronhpdata
_dataname="G4NDL"
pkgver=4.5
pkgrel=1
pkgdesc="Neutron data files with thermal cross sections"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.01')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('fd29c45fe2de432f1f67232707b654c0'
         'f3fc5a858e4bd049f95046bf1e1b3d10')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
