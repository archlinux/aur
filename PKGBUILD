# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tailpipe-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Open-source SIEM for log analysis from the terminal, powered by DuckDB"
arch=('x86_64' 'aarch64')
url="https://github.com/turbot/tailpipe"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/turbot/tailpipe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tailpipe.linux.amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tailpipe.linux.arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('1b615914a52b3d99968155aaeb7b9112fd20fad6646ef8ea25e53a45963476a0')
sha256sums_aarch64=('bc102185240942393c9679e38493c3adaa9e39c4b62cc3b6b8b619bd04ef3a2e')

package() {
  install -Dm755 "tailpipe" "${pkgdir}/usr/bin/tailpipe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
