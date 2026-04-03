# Maintainer: Pranav <your@email.com>
pkgname=hubfetch
pkgver=1.0.3
pkgrel=1
pkgdesc="A CLI ricing tool designed to fetch GitHub user stats"
arch=('any')
url="https://github.com/PranavU-Coder/hubfetch"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/hubfetch/hubfetch-$pkgver.tar.gz")
sha256sums=('b9f7faece2cbc7d855bc4ef2d673a9b8e3abeb728d752c075069c5f01f322f72')

build() {
  cd "hubfetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "hubfetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
