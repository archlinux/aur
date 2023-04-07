# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-apptools'
pkgver=5.2.0
pkgrel=2
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
depends=('python-traits')
makedepends=('python-setuptools')
optdepends=('python-configobj: for apptools.preferences package'
            'python-traitsui: for user interface to apptools')
source=("apptools-$pkgver.tar.gz::https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")
sha256sums=('ccb8f7a2ce7791d81b8f1114b797dbb61346d63b857b262a197ade83f1b0ddb3')

build() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
