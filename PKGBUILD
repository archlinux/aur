# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traitsui
pkgver=7.4.3
pkgrel=2
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('587da5de6b6000a9ec520e3860dd20c030c1a987814cde90d803bc06918aa32d')

build() {
  cd traitsui-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd traitsui-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
