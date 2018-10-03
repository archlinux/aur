# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=gevent-eventemitter
pkgname=(python-gevent-eventemitter-git python2-gevent-eventemitter-git)
pkgver=r16.659116c
pkgrel=1
pkgdesc="Implements EventEmitter using gevent"
arch=('any')
url='https://github.com/rossengeorgiev/gevent-eventemitter'
license=('MIT')
depends=()
makedepends=(python-setuptools)
checkdepends=(python python2 python-nose python-coverage  python2-nose python2-coverage)
source=("git://github.com/rossengeorgiev/gevent-eventemitter")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
  python2 setup.py test
}

package_python-gevent-eventemitter-git() {
  depends=(python python-gevent)
  cd "$srcdir/$_pkgname"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-gevent-eventemitter-git() {
  depends=(python2 python2-gevent)
  cd "$srcdir/$_pkgname"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
