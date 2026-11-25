# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cameradar-bin
pkgver=6.2.1
pkgrel=1
pkgdesc="Cameradar hacks its way into RTSP videosurveillance cameras"
arch=('x86_64' 'aarch64')
url="https://github.com/Ullaakut/cameradar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cameradar_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cameradar_linux_arm64.tar.gz")
sha256sums_x86_64=('eb0603e3b753deea94a7a451e6fb1bb2f47c2c40c7cccff10d8963ea7cf49e9d')
sha256sums_aarch64=('72249df0492d8db34c540768168c9fb643900c5603e4594026cbbedaa46cbdec')

package() {
  install -Dm755 "cameradar" "${pkgdir}/usr/bin/cameradar"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
