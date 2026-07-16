# Maintainer: Ilyas Khallouki <khalloukielias@gmail.com>
pkgname=hypruse
pkgver=0.2.0
pkgrel=1
pkgdesc="Computer use for Hyprland: semantic desktop state over IPC plus vision and native Wayland input, in one MCP server"
arch=('any')
url="https://github.com/IlyasKhallouki/hypruse"
license=('MIT')
depends=('python' 'python-mcp' 'grim' 'wtype')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a92446416892561d456ad6f9f3457d5809cc335cdc9e4ae0490eb8260d04710a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
