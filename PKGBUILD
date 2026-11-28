# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=breakpoint-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="Pause CI workflows and debug them over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/namespacelabs/breakpoint"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/breakpoint_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/breakpoint_linux_arm64.tar.gz")
sha256sums_x86_64=('ba24728a0b8ad9128d8c3cb68942728ab6ba1bcb788b11b53a5bc61243ead1a7')
sha256sums_aarch64=('b28b80469abf277563ea60f09d668e7ad6144f10ccb6802e13cef6c2bf0cd582')

package() {
  install -Dm755 "breakpoint" "${pkgdir}/usr/bin/breakpoint"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
