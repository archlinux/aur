# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2022_08_01_18_07_09.2a36a8d
_pkgver=2022-08-01_18-07-09.2a36a8d
pkgrel=14
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=("jre11-openjdk")
url='https://openpnp.org/'
license=('GPL3')
source=("https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('19c89aa87745d8d203bd79d1de82ae08d8df03ddcd487bfcd9fd60d1126f6522'
            'b47618084d2eda5f57b1f81f6b09ea401d78d73f38c30b3f30412cf7a9029a2d'
            '077cb8d431a443ee67636ed8454f4637042d462a6934c78f739a66abeb288176')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  ln -sf "${pkgdir}/opt/${pkgname}/OpenPnP" "${pkgdir}/usr/bin/OpenPnP"

  # Desktop file
  install -Dm644 "../${_pkgname}.desktop"\
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon file
  install -Dm644 "../OpenPnP.png"\
                 "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
