# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-test-coverage-bin
pkgver=2.23.0
pkgrel=1
pkgdesc="Report when Go test coverage falls below a threshold"
arch=('x86_64' 'aarch64')
url="https://github.com/vladopajic/go-test-coverage"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vladopajic/go-test-coverage/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-test-coverage_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-test-coverage_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('5a19fb5858e73888e287bf09930b72f91c44f846826665fc06f17a6bd7cac948')
sha256sums_aarch64=('db5f159b42397b903206860e252bdca928aff4471684277b1384e23156bc2072')

package() {
  install -Dm755 "go-test-coverage" "${pkgdir}/usr/bin/go-test-coverage"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
