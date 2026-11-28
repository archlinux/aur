# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=speedwagon-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Download Apple platform simulators without Xcode or macOS"
arch=('x86_64' 'aarch64')
url="https://github.com/timsutton/speedwagon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/speedwagon_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/speedwagon_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5e48bcee0449e7a1be9835f069e699fe268eeee540e9e7fe397aa004466d853e')
sha256sums_aarch64=('bbec55e92ec3ac9f1dbedde9d1ad0866f04ce4606f6aff1dee1527e748b83446')

package() {
  install -Dm755 "speedwagon" "${pkgdir}/usr/bin/speedwagon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
