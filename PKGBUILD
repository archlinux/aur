# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ai-rulez-bin
pkgver=5.15.0
pkgrel=1
pkgdesc="Author, generate and validate AI agent rules, skills and MCP configuration across coding assistants"
arch=('x86_64' 'aarch64')
url="https://github.com/Goldziher/ai-rulez"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ai-rulez_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ai-rulez_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3977af9b086d8258a7c52f5f1b47f9295a0f12ca4087ffc7767c0b07b5857469')
sha256sums_aarch64=('b08b051bfff07d3afe2e11ec6b1919e8424283aacdb33f91317bc9b2c994d0f2')

package() {
  install -Dm755 "ai-rulez" "${pkgdir}/usr/bin/ai-rulez"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
