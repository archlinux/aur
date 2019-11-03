# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traits'
pkgver=5.1.2
pkgrel=3
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
sha256sums=('9bafc5211ddbb4f6949511726c1696a080d0a3498c2657b6a1527029b7df7951')

build() {
  cd "$srcdir"/traits-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
