# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.3.0
pkgrel=2
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('fc3d823527a141fa1f11bc2a42f89ba368946c16b0db38ccc2476bc49d2b31ce17eecb88107851d430f6e8b990038579aa0be97861228721426cd10a4df19b7d')
makedepends=('python-setuptools' 'python2-setuptools')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-tkcalendar() {
  depends=('python-babel' 'tk')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1  --skip-build
}

package_python2-tkcalendar() {
  depends=('python2-babel' 'tk')
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1  --skip-build
}

