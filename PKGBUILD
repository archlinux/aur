# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deepx-code-bin
pkgver=0.2.114
pkgrel=1
pkgdesc="DeepSeek coding agent with code graph and OCR support"
arch=('x86_64' 'aarch64')
url="https://github.com/itmisx/deepx-code"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deepx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deepx_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('43f5a31aff4b5449a98ebd90b5eebf8528f5136fefc0d3a9eccf8f968a11a6c2')
sha256sums_aarch64=('973f89a9e9d7f82d84c50dca98f893009fa7f5cc7eca949b2b96807d81566894')

package() {
  install -Dm755 "deepx" "${pkgdir}/usr/bin/deepx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
