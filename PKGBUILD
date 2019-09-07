# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=gevent-eventemitter
pkgname=(python-gevent-eventemitter python2-gevent-eventemitter)
pkgver=2.1
pkgrel=1
pkgdesc='Implements EventEmitter using gevent'
arch=('any')
url='https://github.com/rossengeorgiev/gevent-eventemitter'
license=('MIT')
depends=()
makedepends=(python-setuptools gcc)
checkdepends=(python python2 python-gevent python-pytest python-coverage python2-gevent python2-pytest python2-coverage)
source=("https://github.com/rossengeorgiev/gevent-eventemitter/archive/v$pkgver.tar.gz")
sha256sums=('ec44e3a69c3eab31462babc089d6d650be49e5186258f6284e43b9c7398926b1')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
  python2 setup.py test
}

package_python-gevent-eventemitter() {
  depends=(python python-gevent)
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-gevent-eventemitter() {
  depends=(python2 python2-gevent)
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
