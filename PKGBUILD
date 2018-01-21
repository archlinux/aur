# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=centrifuge
pkgver=1.0.3
pkgrel=1
pkgdesc="Bioinformatics taxonomic classifier for microbial classification"
arch=('x86_64')
url="https://ccb.jhu.edu/software/centrifuge/"
license=('GPL3')
depends=('libpthread-stubs' 'zlib')
source=(ftp://ftp.ccb.jhu.edu/pub/infphilo/"${pkgname}"/downloads/"${pkgname}"-"${pkgver}"-beta-source.zip)
sha256sums=('43b370cd0b8ae40c5ff60516c005313c4a04a4f1e21faca132430c87ef621e63')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"-beta
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"-beta
  make install prefix="${pkgdir}"/usr/bin

  install -Dm644 MANUAL "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL
  install -Dm644 MANUAL.markdown "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL.markdown
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
  install -Dm644 NEWS "${pkgdir}"/usr/share/doc/"${pkgname}"/NEWS
}
