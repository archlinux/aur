# Maintainer: zhangyiyi <zhangyiyiemail@gmail.com>
pkgname=cbm-tool
pkgver=1.0.9
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
sha256sums=('5000b1fdd86b9b1ce4bbebfa0d7ef497afa7abfe24418ca840a5a1d61e3eb2e1')

package() {
  cd "$srcdir/cbm-tool-$pkgver"
  install -Dm755 bin/cbm "$pkgdir/usr/bin/cbm"
  install -Dm644 share/cbm/rules/codebase-memory.md \
    "$pkgdir/usr/share/cbm/rules/codebase-memory.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
