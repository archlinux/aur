# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-apptools'
pkgver=4.5.0
pkgrel=3
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
depends=('python-traits')
makedepends=('python-setuptools')
optdepends=('python-configobj: for apptools.preferences package'
            'python-traitsui: for user interface to apptools')
source=("apptools-$pkgver.tar.gz::https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")
sha256sums=('1bf5931d6e8fa79f94d0de20a5cab1eeedc7775fe599628d14aa51d31004e3ee')

build() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
