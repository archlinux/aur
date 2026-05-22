# Maintainer: Pranav <your@email.com>
pkgname=hubfetch
pkgver=1.0.4
pkgrel=1
pkgdesc="A CLI ricing tool designed to fetch GitHub user stats"
arch=('any')
url="https://github.com/PranavU-Coder/hubfetch"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/hubfetch/hubfetch-$pkgver.tar.gz")
sha256sums=('fc737855e34d5c2d70290f261460cf41d6228d1d0c3fd374679517836ec8022e')

build() {
  cd "hubfetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "hubfetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
