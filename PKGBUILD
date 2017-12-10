# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-realsurfacedata
_dataname="G4RealSurface"
_foldername="RealSurface"
pkgver=2.1
pkgrel=1
pkgdesc="Data files for measured optical surface reflectance"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.4')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('f1c72b31d45905f011e2ec4ea96612f4'
         '9de854a98e09a57329388ea7b3a93bc4')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
