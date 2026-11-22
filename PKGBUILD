# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tree-ring-memory-bin
pkgver=0.15.13
pkgrel=1
pkgdesc="A local-first memory system for AI agents with SQLite full-text search, auditing, forgetting"
arch=('x86_64')
url="https://github.com/TerminallyLazy/Tree-Ring-Memory"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tree-ring-memory-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('a83d9c9fde6c1e4f280394c50aba34ca8b5e3c408d1b70ea9bc50e7485b7554d')

package() {
  cd "tree-ring-memory-${pkgver}-linux-x86_64"
  install -Dm755 "tree-ring" "${pkgdir}/usr/bin/tree-ring"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
