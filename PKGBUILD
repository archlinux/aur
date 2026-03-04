# Maintainer: icanttipe <matthieu@envoidunet.com>
pkgname=freedcamp-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool for Freedcamp project management API"
arch=('any')
url="https://github.com/icanttipe/freedcamp-cli"
license=('MIT')
depends=('python')
optdepends=('bash-completion: tab completion'
            'uv: required for MCP server (freedcamp-mcp)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/icanttipe/freedcamp-cli/archive/v$pkgver.tar.gz")
sha256sums=('afb7d33f262dcaf1ec4da9e2f55974259aa2745da4e2978adbac6d2e34c50c0e')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 freedcamp "$pkgdir/usr/bin/freedcamp"
  install -Dm755 freedcamp-mcp.py "$pkgdir/usr/bin/freedcamp-mcp"
  install -Dm644 freedcamp-completion.bash "$pkgdir/usr/share/bash-completion/completions/freedcamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
