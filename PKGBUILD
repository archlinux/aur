# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bitbang-cli-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Share your machine as a URL over peer-to-peer WebRTC"
arch=('x86_64' 'aarch64')
url="https://github.com/richlegrand/bitbang-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/richlegrand/bitbang-cli/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/bitbang-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/bitbang-linux-arm64")
sha256sums=('e3d24cc5ce1e01fcd02d1d4dabd7f79db03355ec6783d922c9c65d6668fc255a')
sha256sums_x86_64=('6d77b2679f04d2d4b69a03185ce321c2a7f8ea07eead74e75e14b3aa8e60c284')
sha256sums_aarch64=('9f7a90fec3aa9c806e32d772a5175579837e1ac5b81d26d1b56d9b7b542890f1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/bitbang"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
