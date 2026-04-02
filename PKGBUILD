# Maintainer: Pranav <your@email.com>
pkgname=hubfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI ricing tool designed to fetch GitHub user stats"
arch=('any')
url="https://github.com/PranavU-Coder/hubfetch"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/hubfetch/hubfetch-$pkgver.tar.gz")
sha256sums=('9fbcf5e1abf22d7b64f4b99b09131607d1b6fa408c6ef2322d73eb8f83ea84f1')

build() {
  cd "hubfetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "hubfetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
