# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vibeguard-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Lightweight privacy guard for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/inkdust2021/VibeGuard"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/inkdust2021/VibeGuard/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vibeguard_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vibeguard_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('cb9fbdf9b6527da5bd69631eeca205935df6e10e73294e47d851aba21bd3e949')
sha256sums_aarch64=('23e2410a728f80c51372ea18a713f7946d6a6971958d42c6158682d27742fccb')

package() {
  install -Dm755 "vibeguard" "${pkgdir}/usr/bin/vibeguard"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
