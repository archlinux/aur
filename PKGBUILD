# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opencrust-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Personal multi-agent AI assistant platform with RAG and MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/opencrust-org/opencrust"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/opencrust-org/opencrust/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/opencrust-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/opencrust-linux-aarch64")
sha256sums=('2043a0b69605bddbaf74be895da38236362e08172cde654119f0dd5d9ef0d602')
sha256sums_x86_64=('a34aec4da31a98c8b9c94d7e5e2b9712d4f26f04dab24d198ffe8610bfbf8968')
sha256sums_aarch64=('4330be4e3b17d4ed403df466d1dd7fad374ca7bb3e9bdcb141be288aaea0e235')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/opencrust"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
