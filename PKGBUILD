# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-apptools'
pkgver=5.2.1
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
sha256sums=('7ac768cb14bdc72c59f8366c760592f4bf103330656653c9e14468c868bbefea')

build() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
