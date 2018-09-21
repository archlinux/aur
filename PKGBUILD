# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.3.1
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('ba486d96c6ac855a1857204feae83cec918dabdf5c7f9944de742660f1a750e9e3d6617cdc11dbad3997f00eeef2b28205b4737efe61db5ad254f18293219364')
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

