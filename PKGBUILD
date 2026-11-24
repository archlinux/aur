# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyagent-go-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Monitor all your coding agents from one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/illegalstudio/lazyagent"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'lazyagent-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazyagent-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lazyagent-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f0f6940e19ccc712f0d309a064859a450a30792859b4e4144f03b40299c4c040')
sha256sums_aarch64=('44c562e971c4fd8dc7e099110b43fc940ab72c9f095f7e7fae68fe814a8e8cbf')

package() {
  install -Dm755 "lazyagent" "${pkgdir}/usr/bin/lazyagent"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
