# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2023_02_11_15_19_43.ea84c95
_pkgver=2023-02-11_15-19-43.ea84c95
pkgrel=4
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=('java-runtime>=8' 'java-runtime<=15')
url='https://openpnp.org/'
license=('GPL3')
source=("OpenPnP-${_pkgver}.tar.gz"::"https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('0f08e14e4f7733ce64e39fe86540200dda8de56a24d721b38c01600ff2ef6da8'
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
