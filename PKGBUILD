# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mnemon-bin
pkgver=0.2.15
pkgrel=1
pkgdesc="Persistent graph-based memory for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/mnemon-dev/mnemon"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mnemon_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mnemon_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('443828b35fa7ecd083446dedf3574e271ad917c4f23e172b7bda6c09bfc0bb0f')
sha256sums_aarch64=('f9d60ff6fd11af65f8defbe8bd514a94cbd49496bfe13819a81f3156199fe49e')

package() {
  install -Dm755 "mnemon" "${pkgdir}/usr/bin/mnemon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.memory-agent" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.v8" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
