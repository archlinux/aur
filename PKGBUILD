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
sha256sums=('583aa7f34f67b09db7d566f904c54b21e95a9ac05b60e2bfb794efb569dba14e'
            '7affc83de9527970332761cf93f7e7377b52d60e1065e2a8a73a8ec5a6c8f729')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
