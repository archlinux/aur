# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgname='python-pyface'
pkgver=6.1.2
pkgrel=3
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
sha256sums=('70f9977de7294b3804cd5e36b71ba22679e0ab58a6034da32e888e355ac876fa')

build() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
