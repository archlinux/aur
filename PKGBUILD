# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2.6_2026_03_01_12_37_59
_pkgver=2.6_2026-03-01_12-37-59.5bd404c
pkgrel=2
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=('java-runtime')
url='https://openpnp.org/'
license=('GPL3')
source=("OpenPnP-${_pkgver}.tar.gz"::"https://openpnp.s3-us-west-2.amazonaws.com/main/${_pkgver}/OpenPnP-unix-main.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('3950df2d39f52c501d2bd3d663c5044d769b55c83f5cbbc3909726c3f6cb8cac'
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
