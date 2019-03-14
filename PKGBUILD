# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgname='python-pyface'
pkgver=6.0.0
pkgrel=5
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
depends=('python-traits')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: for Qt backend (or pyside2)'
            'python-pyqtwebengine: for Qt backend'
            'pyside2: for Qt backend (or python-pyqt5)'
            'python-pygments: for syntax coloring in Qt backend'
            'python-setuptools: to locate resources inside zip and egg files'
            'ipython: for IPython widget'
            'python-wxpython: for wx backend')
options=(!emptydirs)
source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")
sha256sums=('3dd49ae2d289cc9655cb74296092933113a5ebb92a3f83837cde26eead572b4a')

build() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
