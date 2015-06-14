# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-levelgammadata
_dataname="G4PhotonEvaporation"
_foldername="PhotonEvaporation"
pkgver=3.1
pkgrel=1
pkgdesc="Data files for photon evaporation"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.01')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('e7870c5ef18ba702e68c22b62233cbb8'
         'bd1232c6c7ddf00c66e4936fa79a6757')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
