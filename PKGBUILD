# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-code-sync-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Sync Claude Code conversation history across machines with git"
arch=('x86_64' 'aarch64')
url="https://github.com/perfectra1n/claude-code-sync"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/perfectra1n/claude-code-sync/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/claude-code-sync-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/claude-code-sync-linux-aarch64.tar.gz")
sha256sums=('b0d407e006879e4f4cbd5b016df6df3eb1c1bbb7cbd1336b2d96174e77c7b0b7')
sha256sums_x86_64=('8a64b5ae9a5f934927de2cba7881eb3b5d8472ae2c7f0f554fafdeeb41fe8d3a')
sha256sums_aarch64=('01b2e3a15e9b3e410512213e8073901909718ae8f0f277d157160e3ddef6f0c6')

package() {
  install -Dm755 "claude-code-sync" "${pkgdir}/usr/bin/claude-code-sync"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
