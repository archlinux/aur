# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgname=python-pyface
pkgver=7.3.0
pkgrel=4
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
depends=('python-traits' 'python-importlib_resources')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: for Qt backend (or pyside2)'
            'python-pyqt5-webengine: for Qt backend'
            'pyside2: for Qt backend (or python-pyqt5)'
            'python-pygments: for syntax coloring in Qt backend'
            'python-setuptools: to locate resources inside zip and egg files'
            'ipython: for IPython widget'
            'python-wxpython: for wx backend')
options=(!emptydirs)
source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")
sha256sums=('434aa47f11946fa0294e451aeedc083002b7113cb69dce0f59884279ea38c19c')

build() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
