# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-bind-plugin-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Generate APIs for exported Go plugin symbols"
arch=('x86_64' 'aarch64')
url="https://github.com/wendigo/go-bind-plugin"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-bind-plugin_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-bind-plugin_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ed05990c41ca3e29c9601465af19ab5f638adf59e8c10aa3bd82f048f1c9a078')
sha256sums_aarch64=('9fc8bb0d96772471a94df595ec6f97c0948220dba79b6101a5e93e646aeba376')

package() {
  install -Dm755 "go-bind-plugin" "${pkgdir}/usr/bin/go-bind-plugin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
