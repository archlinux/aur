# Maintainer: zhangyiyi <zhangyiyiemail@gmail.com>
pkgname=cbm-tool
pkgver=1.0.8
pkgrel=1
pkgdesc='Unofficial community CLI wrapper for codebase-memory-mcp'
arch=('any')
url='https://github.com/fxjs/cbm-tool'
license=('MIT')
depends=('bash' 'jq')
optdepends=(
  'curl: used by cbm update / remote install helpers'
  'git: repository indexing workflows'
)
conflicts=('cbm') # Color Bandwidth Meter also ships /usr/bin/cbm
source=("$pkgname-$pkgver.tar.gz::https://github.com/fxjs/cbm-tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66e90c31c50190b8b8bcacc4e2f05b56434ed03469fa390148079e86f304bf96')

package() {
  cd "$srcdir/cbm-tool-$pkgver"
  install -Dm755 bin/cbm "$pkgdir/usr/bin/cbm"
  install -Dm644 share/cbm/rules/codebase-memory.md \
    "$pkgdir/usr/share/cbm/rules/codebase-memory.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
