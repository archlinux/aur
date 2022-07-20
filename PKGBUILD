# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traitsui
pkgver=7.4.0
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python-pyface')
makedepends=('python-setuptools')
source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
sha256sums=('55853041872bc7e35321e6b3816e153bf8982b87f8ab9df529c2e9e17586a3ca')

build() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/traitsui-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
