# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=6.2.0
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
sha256sums=('8ff62fca0b347fd0f7aa43f236d4dd673e663971a2e3c6ac961efd5ddc1c7d91')

build() {
  cd "$srcdir"/traits-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
