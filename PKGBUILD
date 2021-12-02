# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traitsui
pkgver=7.2.1
pkgrel=3
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('be42f0e8d14d164c5fb1a278b3d0a99450d30a7db8c3da37ef9ea20cad615bc9')

build() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
