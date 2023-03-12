# Contributor: Bumsik Kim <k.bumsik@gmail.com>
pkgname=python-qt5reactor
_name=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc="Twisted and PyQt5 eventloop integration"
arch=('any')
depends=('python-pyqt5' 'python-twisted')
makedepends=('python-setuptools')
url="https://github.com/sunu/qt5reactor"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz)
sha256sums=('c3470a8a25d9a339f9ca6243502a9b2277f181d772b7acbff551d5bc363b7572')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  /usr/bin/python3 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  /usr/bin/python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
