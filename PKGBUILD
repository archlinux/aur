# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2022_08_01_18_07_09.2a36a8d
_pkgver=2022-08-01_18-07-09.2a36a8d
pkgrel=10
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=("jre11-openjdk")
url='https://openpnp.org/'
license=('GPL3')
source=("https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz"
        "OpenPnP.desktop")
sha256sums=('19c89aa87745d8d203bd79d1de82ae08d8df03ddcd487bfcd9fd60d1126f6522'
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
