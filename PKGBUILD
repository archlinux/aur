# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-saiddata
_dataname="G4SAIDDATA"
_foldername="G4SAIDDATA"
pkgver=2.0
pkgrel=1
pkgdesc="Data files from evaluated cross-sections in SAID data-base"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('1d26a8e79baa71e44d5759b9f55a67e8b7ede31751316a9e9037d80090c72e91'
            '4afd52387c84f882ad922aa2daeb16754f0f483795155cea03131ec51b7c7baf')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
