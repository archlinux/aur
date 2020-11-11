# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=6.0.0
pkgrel=3
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python')
optdepends=('python-numpy: to support the trait types for arrays'
            'python-traitsui: to support Gui Views')
makedepends=('python-setuptools')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
sha256sums=('6751b6f218bdfd0f34095c241dbc237f18c7cf5992c97c795e7c6abe2dd3850d')

build() {
  cd "$srcdir"/traits-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
