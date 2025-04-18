# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2025_02_02_20_41_38.e468422
_pkgver=2025-02-02_20-41-38.e468422
pkgrel=1
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=('java-runtime>=11' 'java-runtime<=19')
url='https://openpnp.org/'
license=('GPL3')
source=("OpenPnP-${_pkgver}.tar.gz"::"https://openpnp.s3-us-west-2.amazonaws.com/main/${_pkgver}/OpenPnP-unix-main.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('4320e923565a07c01dc02c828bccaca01713bbe03c0eebdc149df89e3b8763ca'
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
