# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-radioactivedata
pkgver=5.4
pkgrel=1
_dataname="G4RadioactiveDecay"
_foldername="RadioactiveDecay${pkgver}"
pkgdesc="Data files for radioactive decay hadronic processes"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.06')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('240779da7d13f5bf0db250f472298c3804513e8aca6cae301db97f5ccdcc4a61'
            'f440d3cfd730dc72608b93e4fe6635f9f6477c322f5128a81fadd8f4c51f9b1e')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername} ${pkgdir}/usr/share/${pkgname}
}
