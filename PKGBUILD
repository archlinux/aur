# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-realsurfacedata
_dataname="G4RealSurface"
_foldername="RealSurface"
pkgver=2.1.1
pkgrel=2
pkgdesc="Data files for measured optical surface reflectance"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('90481ff97a7c3fa792b7a2a21c9ed80a40e6be386e581a39950c844b2dd06f50'
            '79d5404fc0e020dbc39ab98a0615264383a74cfbf0c3b3ec6832811da0087772')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
