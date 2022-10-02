# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=6.4.1
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python')
optdepends=('python-numpy: to support the trait types for arrays'
            'python-traitsui: to support Gui Views')
makedepends=('python-setuptools')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
sha256sums=('974b682d112dfb531136d1185fe8d5f05ffd9e54a76b6dcd9715de85655ee30c')

build() {
  cd traits-$pkgver

  python setup.py build
}

package() {
  cd traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
