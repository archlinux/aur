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
md5sums=('180f1f5d937733b207f8d5677f76296e'
         '9374938c81cee10fff52d9d3a2408214')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
