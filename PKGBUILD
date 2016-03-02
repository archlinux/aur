# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-radioactivedata
_dataname="G4RadioactiveDecay"
_foldername="RadioactiveDecay"
pkgver=4.3.1
pkgrel=1
pkgdesc="Data files for radioactive decay hadronic processes"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.2.1')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('e4a1a08a1c26000ffd32f17c38309c6d'
         'c16245e11b6c8d1d836a3be007651237')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
