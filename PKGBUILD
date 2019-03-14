# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-traits'
pkgver=5.0.0
pkgrel=2
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/release/${pkgver}.tar.gz")
sha256sums=('358cdcae1b17b683eba8910a1156cd6dd6bfa716e6428d4e6252e979d36672c6')

build() {
  cd "$srcdir"/traits-release-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/traits-release-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
