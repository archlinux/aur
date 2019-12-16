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
sha256sums=('6225ad902675f4381c98c6ba25fc5a06ce87549aa979634d3d03491d6616e926'
            'a414b370d8b3dffb488b242a9892cd72c875772cfc99e16b1a0dce543b2cb25b')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
