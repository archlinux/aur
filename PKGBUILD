# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-neutronxsdata
_dataname="G4NEUTRONXS"
pkgver=1.4
pkgrel=1
pkgdesc="Data files for evaluated neutron cross-sections on natural composition of elements"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.0.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('665a12771267e3b31a08c622ba1238a7'
         '1c2baf49b8d69cde060d1538e70717fb')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
