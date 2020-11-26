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
            'fb4a43e320a4061b44e28d140f933bc9b14aa0d2a0ce7f541941e4da6b10b38a')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_dataname}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
