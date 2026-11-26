# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=projectatlas-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Repository map for AI coding agents that saves tokens"
arch=('x86_64')
url="https://github.com/styler-ai/ProjectAtlas"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/projectatlas-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('745db48c00d5dbac2d245284219610582293e9d048949f608a3b4988228b7266')

package() {
  install -Dm755 "projectatlas/projectatlas" "${pkgdir}/usr/bin/projectatlas"
  install -Dm644 "projectatlas/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "projectatlas/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
