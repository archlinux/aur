# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
_pkgname=OpenPnP
pkgver=2023_03_15_00_30_21.460d8aa
_pkgver=2023-03-15_00-30-21.460d8aa
pkgrel=1
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
depends=('java-runtime>=8' 'java-runtime<=15')
url='https://openpnp.org/'
license=('GPL3')
source=("OpenPnP-${_pkgver}.tar.gz"::"https://openpnp.s3-us-west-2.amazonaws.com/develop/${_pkgver}/OpenPnP-unix-develop.tar.gz"
        "OpenPnP.desktop"
        "OpenPnP.png")
sha256sums=('a64f351bef91b19b599c62d017566e2bef497a0ace7ddb4b296afd4f09435ceb'
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
