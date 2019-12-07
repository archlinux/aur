# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=5.2.0
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
sha256sums=('81f56d962d6a92f88ccddbd819a3f7623fa0b9819a9a4f196354cd12bae7d286')

build() {
  cd "$srcdir"/traits-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
