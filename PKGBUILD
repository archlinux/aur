# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kadeessh-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Extensible, modular, memory-safe SSH server"
arch=('x86_64')
url="https://github.com/kadeessh/kadeessh"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kadeessh_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('360de1091720261c2f676b2a28febe2a5bf167f983eb022af792c95c913c191a')

package() {
  install -Dm755 "kadeessh" "${pkgdir}/usr/bin/kadeessh"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
