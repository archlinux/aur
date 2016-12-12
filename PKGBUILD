# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-levelgammadata
_dataname="G4PhotonEvaporation"
_foldername="PhotonEvaporation"
pkgver=4.3
pkgrel=1
pkgdesc="Data files for photon evaporation"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.2.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('012fcdeaa517efebba5770e6c1cbd882'
         '3e112da8ac3dafa3f9a5e21fefe5ea56')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
