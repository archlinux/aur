# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar')
pkgver=1.6.1
pkgrel=1
_name=tkcalendar
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('12b83fa01dcfcb366fc6464896bd1c824d1524626fec31ea29f2c021f02085063f826130f0ab85fa3db5b31fff5269c8a8c21c48b889f277ba92eab513094e54')
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


