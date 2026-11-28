# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slacrawl-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Slack command-line client with a SQLite backend"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/slacrawl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openclaw/slacrawl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slacrawl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/slacrawl_${pkgver}_linux_arm64.tar.gz")
sha256sums=('021abf1cacb291c2b0be92ab078d6c336f859f1bec9a3a3afbc039362971e31e')
sha256sums_x86_64=('0a8f75d3a563ba4c0387d05f4ebd26cfb5d9c82f22f78968f5d69f0b4a28ecc1')
sha256sums_aarch64=('0fb1fa51438c35e5e1a5a64458122e06202f8bdc716b6db4cb0f9d9d48e2f295')

package() {
  install -Dm755 "./slacrawl" "${pkgdir}/usr/bin/slacrawl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
