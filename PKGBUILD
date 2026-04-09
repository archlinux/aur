# Maintainer: Haoda Wang <haoda.wang@jpl.nasa.gov>

pkgname=gmat-bin
pkgver=2026a
pkgrel=1
pkgdesc="An open-source space mission analysis tool"
arch=('x86_64')
url="https://gmat.atlassian.net/wiki/spaces/GW/overview"
license=('Apache')
depends=('gtk3' 'curl' 'glu' 'glycin' 'libsm' 'libxxf86vm' 'libxtst' 'libtiff5')
conflicts=('gmat')
options=('!strip' 'emptydirs')
source=(
  "https://downloads.sourceforge.net/project/gmat/GMAT/GMAT-R${pkgver}/gmat-ubuntu-x64-R${pkgver}.tar.gz"
  "gmat.desktop"
)

package(){
  # Extract package
  tar xf gmat-ubuntu-x64-R${pkgver}.tar.gz -C "${pkgdir}"

  # Move to /opt
  mkdir "${pkgdir}/opt"
  mv "${pkgdir}/GMAT/" "${pkgdir}/opt/"

  # Make output world-readable
  chmod -R 777 "${pkgdir}/opt/GMAT/R${pkgver}/output/"
  chmod -R 777 "${pkgdir}/opt/GMAT/R${pkgver}/data/gui_config/"

  install -Dm644 gmat.desktop "$pkgdir/usr/share/applications/gmat.desktop"
}

sha512sums=(
  'da2481274955d0c1170ffa9135f0310dce2a02459721e6fb54e01cad6391807578af9f82851e68b176ddb7c2206c6551cf918a92074090fc2d6d7583ee070b7b'
  "SKIP"
)
