# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-apptools'
pkgver=5.3.1
pkgrel=1
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
depends=('python-traits')
makedepends=('python-setuptools')
optdepends=('python-configobj: for apptools.preferences package'
            'python-traitsui: for user interface to apptools')
source=("apptools-$pkgver.tar.gz::https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")
sha256sums=('17998f72822259f46625d6ddb6b888afaae63e247db30ffc671ff36c08444e28')

build() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
