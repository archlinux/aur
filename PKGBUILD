# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mempool-cli-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="mempool.space for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/mempool/mempool-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mempool-cli_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mempool-cli_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('8eacd2eb74cb8a9633485781e4603223f968571fb1eebaf09895d907117706f2')
sha256sums_aarch64=('c312ad7d371cf1f394f498a572da279b0a2d05bf7d7eb0a87721abdd65c57bc4')

package() {
  install -Dm755 "mempool-cli" "${pkgdir}/usr/bin/mempool-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
