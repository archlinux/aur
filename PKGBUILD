# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=lossless-cut
pkgver=3.17.33
pkgrel=1
pkgdesc='The swiss army knife of lossless video/audio editing'
arch=('x86_64')
url="https://github.com/mifi/${pkgname}"
license=('MIT')
depends=(zlib)
options=(!strip)
source=("${url}/releases/download/v${pkgver}/LosslessCut-linux.AppImage"
        "https://raw.githubusercontent.com/mifi/${pkgname}/master/LICENSE")
md5sums=('c66a117ab1f39664ae9c8f18159d4d57'
         'e7f1e3e60965afe836ca1455f8ba5a8b')

package() {
	cd "${srcdir}"
  install -Dm755 -t "${pkgdir}/opt/${pkgname}" LosslessCut-linux.AppImage
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/LosslessCut-linux.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm444 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
