# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deeporg-bin
pkgver=3.25.0
pkgrel=1
pkgdesc="DeepORG (formerly GraphJin) one AI agent for your whole organization: databases, APIs, files, and code over MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/dosco/deeporg"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deeporg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deeporg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d9da96471f0b37e603c2e61eeb7deaedecc8f7d542e6a0c97b55258d185fcff2')
sha256sums_aarch64=('b6ae4665e974d21ace9339cd0df52cd227e12f79bc7cd31f297de6553117915b')

package() {
  install -Dm755 "deeporg" "${pkgdir}/usr/bin/deeporg"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
