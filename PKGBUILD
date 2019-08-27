# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.5.1
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('64a33365b4016f9bda1559d1fe86c5bc3aa944d13e241fb11764dff93f61adf53f9c25f26925f687bdf97d5c72ea039ff5b9a8ca590d3969b5bf92b44f1d4cb0')
makedepends=('python-setuptools' 'python2-setuptools')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-tkcalendar() {
  depends=('python-babel' 'tk')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-tkcalendar() {
  depends=('python2-babel' 'tk')
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

