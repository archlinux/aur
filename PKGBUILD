# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=turbolift-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="Apply changes across many GitHub repositories at once"
arch=('x86_64' 'aarch64')
url="https://github.com/Skyscanner/turbolift"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/turbolift_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/turbolift_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('48bbf6d6fa0eb6baeae9b588cc296eafdb710e84dcdaee8f8afb9d34841869a1')
sha256sums_aarch64=('d65e9a06feeb88bd33a9f79fc52651c3d66cd42ed6aa759e2cc7863ee205bea1')

package() {
  install -Dm755 "turbolift" "${pkgdir}/usr/bin/turbolift"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
