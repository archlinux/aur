# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=uefitool-bin
pkgver=0.28.0
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD')
provides=("uefitool=${pkgver}" "uefipatch=${pkgver}" "uefireplace=${pkgver}")
depends=('qt5-base')
source=("UEFIPatch-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIPatch_${pkgver}_linux_x86_64.zip"
    "UEFIReplace-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIReplace_${pkgver}_linux_x86_64.zip"
    "UEFITool-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFITool_${pkgver}_linux_x86_64.zip"
        'LICENSE::https://github.com/LongSoft/UEFITool/raw/master/LICENSE.md')
sha256sums=('8cedd420e76d3e552d0dab53ca648159fe17a01d7f3c9a668ba16193bf5420ec'
            '3b8df98d9f3d10be2c33c9cbcd03237a99727fdf5eb6988bce23f7da8b39f432'
            'df07d5a59bce570e09eaf8711fc6e760d69c1c5692c31342db38c65498035ca3'
            'fa9dc837378838e632d09ca56f1b8e8b002245b9b4471a4335024d74616c4c1f')

package() {
  install -Dm755 "${srcdir}"/UEFIPatch "${pkgdir}/usr/bin/uefipatch"
  install -Dm755 "${srcdir}"/UEFIReplace "${pkgdir}/usr/bin/uefireplace"
  install -Dm755 "${srcdir}"/UEFITool "${pkgdir}/usr/bin/uefitool"
  install -Dm644 "${srcdir}"/*.txt -t "${pkgdir}/usr/share/uefitool/doc/"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: