# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traitsui'
pkgver=6.0.0
pkgrel=3
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('8ac096486f9a8615ad4c15276e3aaa55810e89ef029d358b1421c26501921f9a')

build() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
