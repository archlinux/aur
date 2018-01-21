# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=centrifuge-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="Bioinformatics taxonomic classifier for microbial classification"
arch=('x86_64')
url="https://ccb.jhu.edu/software/centrifuge/"
license=('GPL3')
provides=('centrifuge')
conflicts=('centrifuge')
source=(ftp://ftp.ccb.jhu.edu/pub/infphilo/"${pkgname//-bin/}"/downloads/"${pkgname//-bin/}"-"${pkgver}"-beta-Linux_x86_64.zip)
sha256sums=('acf3612c92f50d256715e8847a5c68bf58dc7bf7cb730f37e53f7c49930cdaa3')

package() {
  cd "${srcdir}"/"${pkgname//-bin/}"-"${pkgver}"-beta

  for script in centrifuge*; do
    install -Dm755 "${script}" "${pkgdir}"/usr/bin/$(basename "${script}")
  done

  install -Dm644 MANUAL "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL
  install -Dm644 MANUAL.markdown "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL.markdown
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
  install -Dm644 NEWS "${pkgdir}"/usr/share/doc/"${pkgname}"/NEWS
  install -Dm644 doc/README "${pkgdir}"/usr/share/doc/"${pkgname}"/README
}
