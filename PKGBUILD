# Maintainer: Mike Pento <mpento darkforge net>

pkgname=uefitool-bin
pkgver=A59
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD')
provides=("uefitool=${pkgver}" "uefipatch=${pkgver}" "uefireplace=${pkgver}")
depends=('qt5-base')
source=("UEFIExtract-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIExtract_NE_${pkgver}_linux_x86_64.zip"
    "UEFIFind-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIFind_NE_${pkgver}_linux_x86_64.zip"
    "UEFITool-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFITool_NE_${pkgver}_linux_x86_64.zip"
        'LICENSE::https://github.com/LongSoft/UEFITool/raw/master/LICENSE.md')
sha256sums=('11ae7656e675f47e42684fe2bfb1e09f18825f9bf787892fb25c0a8d9cf04ac7'
            '99e99ef519d0820da59d28c20d51df4b75c69755b58728656d713773f53118ae'
            'a884825ba95666c65c5cd0b4e9d3bcfb3528494949b6c7b7b3b698d1ca20bc3e'
            'fa9dc837378838e632d09ca56f1b8e8b002245b9b4471a4335024d74616c4c1f')

package() {
  install -Dm755 "${srcdir}"/UEFIExtract "${pkgdir}/usr/bin/uefiextract"
  install -Dm755 "${srcdir}"/UEFIFind "${pkgdir}/usr/bin/uefifind"
  install -Dm755 "${srcdir}"/UEFITool "${pkgdir}/usr/bin/uefitool"
#  install -Dm644 "${srcdir}"/*.txt -t "${pkgdir}/usr/share/uefitool/doc/"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
