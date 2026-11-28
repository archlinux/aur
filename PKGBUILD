# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=earl-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Secure CLI proxy for AI agents with keychain secrets and MCP integration"
arch=('x86_64' 'aarch64')
url="https://github.com/mathematic-inc/earl"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mathematic-inc/earl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/earl-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/earl-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ce046aa6b5f18e080296b519eb5b9e6183a31d56e12c6f8ea52e929e2ecb0b31')
sha256sums_x86_64=('a42adfb2e2b7190f7c7ca621b6068b4be63a5f537b973af538b59a3511fc66ae')
sha256sums_aarch64=('a5be99a5dfaaef8621b85b19882674cb63307b7b35deb4f8f19c621e1439b43f')

package() {
  install -Dm755 "earl" "${pkgdir}/usr/bin/earl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
