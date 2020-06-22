# Maintainer: Haoda Wang <haoda.wang@jpl.nasa.gov>

pkgname=gmat-bin
pkgver=2018a
pkgrel=1
pkgdesc="An open-source space mission analysis tool"
arch=('x86_64')
url="http://gmatcentral.org/"
license=('Apache')
groups=('')
depends=('cspice' 'libpng12' 'tcsh' 'gtk2')
conflicts=('gmat')
options=('!strip' '!emptydirs')
source=("https://downloads.sourceforge.net/project/gmat/GMAT/GMAT-R${pkgver}/gmat-ubuntu-x64-R${pkgver}.tar.gz")

package(){
  # Extract package
  tar xf gmat-ubuntu-x64-R${pkgver}.tar.gz -C "${pkgdir}"

  # Move to /opt
  mkdir "${pkgdir}/opt"
  mv "${pkgdir}/GMAT/" "${pkgdir}/opt/"

  # Make output world-readable
  chmod -R 777 "${pkgdir}/opt/GMAT/R${pkgver}/output/"
}

sha512sums=('9b1edbf8e9a692a2a6f5410b1165ae4b0e2085dbb05f7acbef2c4145f22d54b9525657ae900acfe8e73088a42f2f3829a3b5ffe277244cfc1d7eb0a9a1085414')
