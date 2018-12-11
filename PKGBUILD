# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-incldata
_dataname="G4INCL"
pkgver=1.0
pkgrel=1
pkgdesc="Data files for proton and neutron density profiles in INCL"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('716161821ae9f3d0565fbf3c2cf34f4e02e3e519eb419a82236eef22c2c4367d'
            'a862b5382ad5329ea1e4788dc28a746f2e20413b05f97210757c078858793a5e')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
