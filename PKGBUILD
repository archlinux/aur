# First Linux Arch packager: Bumsik Kim <k.bumsik@gmail.com>
pkgname=python-qt5reactor
_name=${pkgname#python-}
pkgver=0.5
pkgrel=1
pkgdesc="Twisted and PyQt5 eventloop integration"
arch=('any')
depends=('python-pyqt5' 'python-twisted')
makedepends=('python-setuptools')
url="https://github.com/sunu/qt5reactor"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz)
sha256sums=('58d71f17188c896596e5f23f0eb884c966208a4db935e506d931797cbd1c0cbe')

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
