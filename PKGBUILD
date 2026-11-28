# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openclaw-dashboard-bin
pkgver=2026.9.7
pkgrel=1
pkgdesc="Zero-dependency command center for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/mudrii/openclaw-dashboard"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openclaw-dashboard-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openclaw-dashboard-linux-arm64.tar.gz")
sha256sums_x86_64=('5e92e2f8b99c51089843a18192727db9b6f105a8a4bca7a4d2a60132d6208339')
sha256sums_aarch64=('8e5968414ee2ceb3d8b0fa7037dce0a38cd532d122d510f4360958a08c81ef62')

package() {
  install -Dm755 "openclaw-dashboard" "${pkgdir}/usr/bin/openclaw-dashboard"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
