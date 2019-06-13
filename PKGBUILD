# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traitsui'
pkgver=6.1.1
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('1a223fe0da390727f7d502255412b8f604b1f93a9239625dca705ec67b23bd8d')

build() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
