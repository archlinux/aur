# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-saiddata
_dataname="G4SAIDDATA"
_foldername="G4SAIDDATA"
pkgver=1.1
pkgrel=3
pkgdesc="Data files from evaluated cross-sections in SAID data-base"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
depends=('geant4>=10.0.0')
#it cannot be optdepend since we require the geant4.sh file to exist
#to setup the environment variable
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('d88a31218fdf28455e5c5a3609f7216f'
         '33cb57ee1ea1f690b807458214fa9aae')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}
}
