# Maintainer: Pranav <your@email.com>
pkgname=hubfetch
pkgver=1.0.5
pkgrel=1
pkgdesc="A CLI ricing tool designed to fetch GitHub user stats"
arch=('any')
url="https://github.com/PranavU-Coder/hubfetch"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/hubfetch/hubfetch-$pkgver.tar.gz")
sha256sums=('4ac742d874f843adb71337cbf9910107317d1597c838468bef3b91bcd3e8f170')

build() {
  cd "hubfetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "hubfetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
