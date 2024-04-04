# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=6.4.1
pkgrel=4
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python')
optdepends=('python-numpy: to support the trait types for arrays'
            'python-traitsui: to support Gui Views')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
sha256sums=('974b682d112dfb531136d1185fe8d5f05ffd9e54a76b6dcd9715de85655ee30c')

build() {
  cd traits-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd traits-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
