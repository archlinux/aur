# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-particlexsdata
_dataname="G4PARTICLEXS"
pkgver=1.1
pkgrel=1
pkgdesc="Data files for evaluated particle cross-sections on natural composition of elements"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.5')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
conflicts=('geant4-neutronxsdata')
provides=('geant4-neutronxsdata')
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('100a11c9ed961152acfadcc9b583a9f649dda4e48ab314fcd4f333412ade9d62'
            'f0da8bf5dc3b889b7b1e3cad6dccdbc213c77c4882704f31cf125016c421c6e6')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
