# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=terraphim-ai-bin
pkgver=1.21.3
pkgrel=1
pkgdesc="Deterministic AI assistant"
arch=('x86_64' 'aarch64')
url="https://github.com/terraphim/terraphim-ai"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/terraphim/terraphim-ai/v${pkgver}/LICENSE-Apache-2.0")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/terraphim-cli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/terraphim-cli-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('47528e762efc05e17ae569ffeacf044b65cbe2c94bc9c58c576f267a5cd7d039')
sha256sums_x86_64=('892d28a6d6e9730b7e4a44fafb264f933e9c40336a498c643866f4b04e95aa55')
sha256sums_aarch64=('46e883010a0d7d91ea43a244b52a6ba2d6fea6cd0a6d3a4280258b15b83f605e')

package() {
  install -Dm755 "terraphim-cli" "${pkgdir}/usr/bin/terraphim-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
