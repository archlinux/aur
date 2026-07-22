# Maintainer: zhangyiyi <zhangyiyiemail@gmail.com>
pkgname=cbm-tool
pkgver=1.0.4
pkgrel=1
pkgdesc='Unofficial community CLI wrapper for codebase-memory-mcp'
arch=('any')
url='https://github.com/fxjs/cbm-tool'
license=('MIT')
depends=('bash')
optdepends=(
  'curl: used by cbm update / remote install helpers'
  'git: repository indexing workflows'
)
conflicts=('cbm') # Color Bandwidth Meter also ships /usr/bin/cbm
source=("$pkgname-$pkgver.tar.gz::https://github.com/fxjs/cbm-tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('167dea2dbab8fa8ad79792600b0b76f2d923d4869602ade63fe658b782ae0c87')

package() {
  cd "$srcdir/cbm-tool-$pkgver"
  install -Dm755 bin/cbm "$pkgdir/usr/bin/cbm"
  install -Dm644 share/cbm/rules/codebase-memory.md \
    "$pkgdir/usr/share/cbm/rules/codebase-memory.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
