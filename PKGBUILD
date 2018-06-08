# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=centrifuge-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Bioinformatics taxonomic classifier for microbial classification"
arch=('x86_64')
url="https://ccb.jhu.edu/software/centrifuge/"
license=('GPL3')
provides=('centrifuge')
conflicts=('centrifuge')
source=("${pkgname}"-"${pkgver}".zip::https://github.com/infphilo/"${pkgname//-bin/}"/archive/v"${pkgver}"-beta.zip)
sha256sums=('eac073bbe3af4d1ae8c62e83e1eb7b91ebc1ad4e617929596748a605a3fa5a04')

package() {
  cd "${srcdir}"/"${pkgname//-bin/}"-"${pkgver}"-beta

  for script in centrifuge-*; do
    install -Dm755 "${script}" "${pkgdir}"/usr/bin/$(basename "${script}")
  done

  install -Dm644 MANUAL "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL
  install -Dm644 MANUAL.markdown "${pkgdir}"/usr/share/doc/"${pkgname}"/MANUAL.markdown
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
  install -Dm644 NEWS "${pkgdir}"/usr/share/doc/"${pkgname}"/NEWS
  install -Dm644 doc/README "${pkgdir}"/usr/share/doc/"${pkgname}"/README
}
