# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=flet-mcp
pkgver=1.1.4
pkgrel=1
pkgdesc="Flet MCP server for LLM agents"
arch=('any')
url="https://flet.dev"
license=('Apache-2.0')
depends=('python' 'python-fastmcp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/fb/b1/701e1d65677ad5f48f3f111cf882169b9f9605ea3af4298f1e9b22d2e52f/flet_mcp-$pkgver.tar.gz")
sha256sums=('ad9ab65346249f7c8087cb9ebb76feda8991fd65c67c31fa95ad98025e6bd34c')

build() {
  cd "flet_mcp-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "flet_mcp-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
