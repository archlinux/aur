# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-neutronhpdata
_dataname="G4NDL"
pkgver=4.6
pkgrel=2
pkgdesc="Neutron data files with thermal cross sections"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.06')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('9d287cf2ae0fb887a2adce801ee74fb9be21b0d166dab49bcbee9408a5145408'
            '444c5c1305a433b5cda8fe921aacd3cef9a34ada1ed54cf3a48d9ee2ef572344')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
