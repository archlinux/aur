# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-levelgammadata
_dataname="G4PhotonEvaporation"
_foldername="PhotonEvaporation"
pkgver=5.5
pkgrel=2
pkgdesc="Data files for photon evaporation"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.06')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('5995dda126c18bd7f68861efde87b4af438c329ecbe849572031ceed8f5e76d7'
            '10c9e0538652bedbeebfc20380970b6b60eacf57f4b4ab70d3b0ce078da57eec')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
