# Maintainer: Agustin Cisneros <agustincc@tutanota.com>

pkgname=ticktick
pkgver=1.0.80
pkgrel=2
pkgdesc='Official desktop application for Linux'
arch=('x86_64')
url='https://ticktick.com/about/download'
license=('custom')
conflicts=('ticktick-nativefier')
depends=('alsa-lib' 'gtk3' 'nss')
source=("${pkgname}-${pkgver}.deb::https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/${pkgname}-${pkgver}-amd64.deb"
        'LICENSE')
sha256sums=('10afbc3451229b681c163f6de80198746565c858fd62aecd68e89add72b2ddc7'
            '2d866fcb749c30d931fa96cc1578869b3fa9fc61a5c5f30e0316ddb00abb5814')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  # Install license from https://ticktick.com/about/tos
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mv "${pkgdir}/opt/TickTick/LICENSE.electron.txt" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  mv "${pkgdir}/opt/TickTick/LICENSES.chromium.html" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
