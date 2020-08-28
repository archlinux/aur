# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-particlehpdata
_varname='G4PARTICLEHPDATA'
_dataname="G4TENDL"
_foldername='G4TENDL'
pkgver=1.3.2
pkgrel=2
pkgdesc="Optional data files for incident particles"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=10.5')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('3b2987c6e3bee74197e3bd39e25e1cc756bb866c26d21a70f647959fc7afb849'
            '754330c114c1fc60b8a40173346c25b4c2c9f6aa188ee6b5fcd09e4601488ef3')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
