# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.5.0
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('725b85184a6fe5f99632a89b02a9650d62b4b766feb7a2fe2d3dc315177fdff5caead8b57e1ea46540a6b4881465e7a4ba22a8d1b82fe55e5b5cf56b609409dc')
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

