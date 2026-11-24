# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=futon-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="TUI manga reader"
arch=('x86_64' 'aarch64')
url="https://github.com/KabosuNeko/Futon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/futon_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/futon_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a999a66ae3dadc6a17f903ed067cf05aad10c9eb62ea8ff294762e2653a8175e')
sha256sums_aarch64=('a6d0fae0238256db3d74263051d0d9d71895466c2417c266caf2a56b697788e2')

package() {
  install -Dm755 "futon" "${pkgdir}/usr/bin/futon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
