# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-visvis
pkgver=1.9.2
pkgrel=1
pkgdesc="A pure Python library for visualization of 1D to 4D data in an object oriented way"
url="https://github.com/almarklein/visvis"
arch=('any')
license=('BSD')
depends=('python-numpy' 'python-opengl')
makedepends=('python-distribute')
optdepends=('python-pyqt4: for Qt4 backend'
            'python-pyside: for another Qt4 backend'
            'wxpython: for WxWidgets backend'
            'pygtk: for GTK backend')
source=(https://github.com/almarklein/visvis/archive/v${pkgver}.tar.gz)
md5sums=('1ea4eb4f12ea4ceb7476c979d4790b3d')

build() {
  cd "${srcdir}"/visvis-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/visvis-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
