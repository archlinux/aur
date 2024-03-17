# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2024_02_08_07_03_33.5dd12c7
_pkgver=2024-02-08_07-03-33.5dd12c7
pkgrel=1
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=('java-runtime>=8' 'java-runtime<=15')
url='https://openpnp.org/'
license=('GPL3')
source=("OpenPnP-${_pkgver}.tar.gz"::"https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('3f006e99ccf64fea4c0504663f6d86044c036f0b2fc723181804920f6ab3e75d'
            '7658037d685d39b77383e5fa9aef9946a6fffa8c95c7d2b3b0732065ddc15bb4'
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
