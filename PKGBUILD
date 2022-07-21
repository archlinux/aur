# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2022_06_19_21_15_55.af43024
_pkgver=2022-06-19_21-15-55.af43024
pkgrel=9
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=("jre11-openjdk")
url='https://openpnp.org/'
license=('GPL3')
source=("${pkgname}::https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz" "OpenPnP.desktop")
sha256sums=('129ce7b7987605fd6f5b7978f744d36de84b9855b50c52599d528a0d2a6699b2'
            '601e6d05eb9ba2ab339a30748f62db313b6deb8c2f12ab55f97841c111233d5f')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  ln -sf "${pkgdir}/opt/${pkgname}/OpenPnP" "${pkgdir}/usr/bin/OpenPnP"

  # Desktop file
  install -Dm644 "../${_pkgname}.desktop"\
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
