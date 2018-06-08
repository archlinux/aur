# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=centrifuge
pkgver=1.0.4
pkgrel=1
pkgdesc="Bioinformatics taxonomic classifier for microbial classification"
arch=('x86_64')
url=https://ccb.jhu.edu/software/centrifuge/
license=('GPL3')
depends=('libpthread-stubs' 'zlib')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/infphilo/"${pkgname}"/archive/v"${pkgver}"-beta.tar.gz)
sha256sums=('64eb3aa3461d27462357811832f39a8f85702eb536482f1e67344761ad8ca757')

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
