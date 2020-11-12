# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traitsui
pkgver=7.0.0
pkgrel=3
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('72fd09d04e134099ca4a318b549063a686e2e8c94de6743c38665396cc8b2636')

build() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
