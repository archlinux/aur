# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cirrus-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Run Cirrus CI tasks locally and in any CI"
arch=('x86_64' 'aarch64')
url="https://github.com/cirruslabs/cirrus-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cirrus-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cirrus-linux-arm64.tar.gz")
sha256sums_x86_64=('a2aed881d8d0bfb17466a1bdfaaa553ca3ae64ea0bef57aa1a47107322941933')
sha256sums_aarch64=('801aa5a6ee757a5872ef4aaea03ed87ace0910315bc5945405b9c4bedfa4f075')

package() {
  install -Dm755 "cirrus" "${pkgdir}/usr/bin/cirrus"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
