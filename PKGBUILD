# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traitsui'
pkgver=6.1.3
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('476159eafbeac48dc4741b2a3a371dd21ba68665cfd4b17fd88f6df9db2e1a47')

build() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
