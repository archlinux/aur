# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar')
pkgver=1.6.0
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('294b55a3bccc07c66326c9daf10e66582db163daecc325228d1335c3b788a58a16a31389e4e1a1811a0fd3089748b386d1bb1766ce071f4fa200983a737d2e61')
makedepends=('python-setuptools')
depends=('python-babel' 'tk')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}


