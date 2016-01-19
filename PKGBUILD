# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=py_time_widget
pkgver=1.1
pkgrel=1
pkgdesc="Sends the current time to libnotify. Desktop widget"
arch=('i686' 'x86_64')
url="https://github.com/rndmh3ro/py_time_widget"
depends=('python' 'python-schedule' 'libnotify')
makedepends=('python')
license=('GPL3')
source=('https://pypi.python.org/packages/source/p/py_time_widget/py_time_widget-1.1.tar.gz')
md5sums=('b6b3757d982a1f651b5c48f569e1b2d7')

build() {
    cd $srcdir/py_time_widget-1.1
    python setup.py build
}

package() {
    cd $srcdir/py_time_widget-1.1
    python setup.py install --root="$pkgdir" --optimize=1
    install -d ${pkgdir}/usr/bin/
    install -m755 ${srcdir}/py_time_widget-1.1/py_time_widget/time_widget.py ${pkgdir}/usr/bin/py_time_widget

}
