# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-ensdfstatedata
_dataname="G4ENSDFSTATE"
_foldername="G4ENSDFSTATE"
pkgver=1.2
pkgrel=1
pkgdesc="Nuclei properties from the Evaluated Nuclear Structure Data Files"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.0.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('a2e88f2c626141e4be4587c838832707'
         'a15282cacbcb37280ffcc756670b33c2')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
