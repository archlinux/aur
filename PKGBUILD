# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-realsurfacedata
_dataname="G4RealSurface"
_foldername="RealSurface"
pkgver=2.1.1
pkgrel=1
pkgdesc="Data files for measured optical surface reflectance"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('90481ff97a7c3fa792b7a2a21c9ed80a40e6be386e581a39950c844b2dd06f50'
            '9188f77f96fb4f6540d5b624d0c540303fbcefca23a7518de3477efd49bcc78d')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
