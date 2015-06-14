# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-abladata
_dataname="G4ABLA"
_foldername="G4ABLA"
pkgver=3.0
pkgrel=1
pkgdesc="Data files for nuclear shell effects in INCL/ABLA hadronic mode"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.0.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('d7049166ef74a592cb97df0ed4b757bd'
         '74b0812ebdd78e45551d5d6f7b92c1bb')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
