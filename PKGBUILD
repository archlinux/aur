# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=anthropometer-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A btop-style TUI that renders a Claude Code session's live context window as a memory map"
arch=('x86_64' 'aarch64')
url="https://github.com/arian-shamaei/anthropometer"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/amtr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/amtr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('941712ab52f77abbde8442953cef3925883be0a9918c91026cdd4ebb115901d0')
sha256sums_aarch64=('56f78c57a17ddc3835ee608e52862e134d0f011ad0b71dc888965a9fb95cafc1')

package() {
  install -Dm755 "amtr" "${pkgdir}/usr/bin/amtr"
  install -Dm644 "man/amtr.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
