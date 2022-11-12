# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traitsui
pkgver=7.4.2
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('98b7974b5bf9f84ca78358c21ba61c9c73de072b143c66bd00baeca5fa085062')

build() {
  cd traitsui-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd traitsui-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
