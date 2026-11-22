# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blippy-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="A keyboard-first TUI for GitHub issues and pull requests"
arch=('x86_64')
url="https://github.com/AksharP5/blippy"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/blippy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0e3eef4cd4d9fb788eded7aaf13c2a2ca1b9b50593a6dc0a167c193deda4c29f')

package() {
  cd "blippy-x86_64-unknown-linux-gnu"
  install -Dm755 "blippy" "${pkgdir}/usr/bin/blippy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
