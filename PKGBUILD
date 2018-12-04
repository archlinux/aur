# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.4.0
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('c2aae13f73d225735763afd3d8dc8f6007cae4bd8d164ccba76c658b251ec6ccf3fe0d1e90dd19e2ff94447ca9e50eb16a6ca7750b08c8b7b3b5d5bc70ccebe7')
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

