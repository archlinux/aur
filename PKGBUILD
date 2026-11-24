# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kanban-md-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="File-based kanban board for agent loops, with a CLI and TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/antopolskiy/kanban-md"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kanban-md_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kanban-md_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6c3e49c1f4383faeda8d49e93f186e6302f1b33258f544345f7ad43d9e10b403')
sha256sums_aarch64=('886a4258b0925b3f0dec2ecd8262679717a0d59184c38a629601158db6e93fbb')

package() {
  install -Dm755 "kanban-md" "${pkgdir}/usr/bin/kanban-md"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
