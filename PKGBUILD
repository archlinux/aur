# Maintainer: Haoda Wang <haoda.wang@jpl.nasa.gov>

pkgname=gmat-bin
pkgver=2025a
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
  '5b8e36b85e3c1b409971114b601d049fc5c6341fdafe06e35d57b4d0c13739a602ae9be61d3e47b7ed919ebc94c21f33d045a3d90c8daaea5aae477f9236bcf2'
  "SKIP"
)
