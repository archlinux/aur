# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-visvis
pkgver=1.10.0
pkgrel=1
pkgdesc="A pure Python library for visualization of 1D to 4D data in an object oriented way"
url="https://github.com/almarklein/visvis"
arch=('any')
license=('BSD')
depends=('python-numpy' 'python-opengl' 'python-imageio')
makedepends=('python-distribute')
optdepends=('python-pyqt4: for Qt4 backend'
            'python-pyside: for another Qt4 backend'
            'wxpython: for WxWidgets backend'
            'pygtk: for GTK backend')
source=(https://github.com/almarklein/visvis/archive/v${pkgver}.tar.gz)
md5sums=('ee0dd00926602b80028792cb441d6261')

build() {
  cd "${srcdir}"/visvis-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/visvis-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"
}
