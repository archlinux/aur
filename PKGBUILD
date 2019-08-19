# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traitsui'
pkgver=6.1.2
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('53a6f176bfab9d94035ef77dceb467539b712f147f4d8ae4cf6cd22244f219d3')

build() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
