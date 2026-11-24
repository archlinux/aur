# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trophy-tui-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="3D model viewer for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/taigrr/trophy"
license=('0BSD')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'trophy')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trophy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/trophy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('67d7bb32e6d979b3f92ab510ea67cdb942ac770a0db6636b8729e5ab52f5a07e')
sha256sums_aarch64=('e2180797e9c2444ca4a62d20bdb190077675ed3f92da988f460a2467071d3da5')

package() {
  install -Dm755 "trophy" "${pkgdir}/usr/bin/trophy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
