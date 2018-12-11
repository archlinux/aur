# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-levelgammadata
_dataname="G4PhotonEvaporation"
_foldername="PhotonEvaporation"
pkgver=5.3
pkgrel=1
pkgdesc="Data files for photon evaporation"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('d47ababc8cbe548065ef644e9bd88266869e75e2f9e577ebc36bc55bf7a92ec8'
            '08d38848269f752f07a5431e7aaa3b3af8143d6bac58e19c40b9456806904f64')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
