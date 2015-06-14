# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-piidata
_dataname="G4PII"
pkgver=1.3
pkgrel=3
pkgdesc="Data files for shell ionisation cross-sections"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=9.6.2')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('05f2471dbcdf1a2b17cbff84e8e83b37'
         '330a43a0d29e0c706bcfc262c80292d8')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
