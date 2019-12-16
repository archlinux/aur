# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-abladata
_dataname="G4ABLA"
_foldername="G4ABLA"
pkgver=3.1
pkgrel=1
pkgdesc="Data files for nuclear shell effects in INCL/ABLA hadronic mode"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.4.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('7698b052b58bf1b9886beacdbd6af607adc1e099fc730ab6b21cf7f090c027ed'
            '89ddd9fb1b7d855cd1bbe75c7c7e3843b48adc4afeaaaf846d6355cd3e86f9b8')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
