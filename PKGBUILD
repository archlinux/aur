# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-radioactivedata
pkgver=5.1
pkgrel=1
_dataname="G4RadioactiveDecay"
_foldername="RadioactiveDecay${pkgver}"
pkgdesc="Data files for radioactive decay hadronic processes"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.3')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('994853b153c6f805e60e2b83b9ac10e0'
         'b1766e7951ab345606df76e2eb8c3f37')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername} ${pkgdir}/usr/share/${pkgname}
}
