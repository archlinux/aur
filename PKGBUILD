# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gifgrep-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Search for GIFs from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/gifgrep"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gifgrep_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gifgrep_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('36768094df265fe9a9c2dfa2221da4c40d4f7a043ac22ab972c2ad9e1a3ca0a0')
sha256sums_aarch64=('f26a41bd16561b126429d7ddd7d6b8a6da96a664f3e8dd70a319fcce478ff037')

package() {
  install -Dm755 "./gifgrep" "${pkgdir}/usr/bin/gifgrep"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
