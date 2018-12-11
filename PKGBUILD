# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-ledata
_dataname="G4EMLOW"
pkgver=7.7
pkgrel=1
pkgdesc="Data files for low energy electromagnetic processes"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('16dec6adda6477a97424d749688d73e9bd7d0b84d0137a67cf341f1960984663'
            '4c135a5d452a800f4fed61d45bc75391cd5156bc0d007a8e9d8ac3c47c69e6c5')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
