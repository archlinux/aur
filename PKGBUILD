# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-ensdfstatedata
_dataname="G4ENSDFSTATE"
_foldername="G4ENSDFSTATE"
pkgver=2.2
pkgrel=1
pkgdesc="Nuclei properties from the Evaluated Nuclear Structure Data Files"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.4.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('dd7e27ef62070734a4a709601f5b3bada6641b111eb7069344e4f99a01d6e0a6'
            '601b810b46781f951a8064beef1a7acac7b17006fca67b252b9f0622bd514110')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
