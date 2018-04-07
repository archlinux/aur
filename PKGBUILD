# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=steam
pkgname=(python-steam python2-steam)
pkgver=0.9.0
pkgrel=1
pkgdesc='Module for interacting with various Steam features'
arch=('any')
url='https://github.com/ValvePython/steam'
license=('MIT')
depends=()
makedepends=(python-setuptools)
checkdepends=(python python-nose python-coverage python-mock python-vcrpy python2 python2-nose python2-coverage python2-mock python2-vcrpy)
source=("https://github.com/ValvePython/steam/archive/v$pkgver.tar.gz")
sha256sums=('80537106c83502dac09592b069bde35ef309c365ecac18b5d9008f31395486b9')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
  python2 setup.py test
}

package_python-steam() {
  depends=(python python-six python-cryptography python-requests python-gevent python-protobuf python-pyaml  python-sphinx python-vdf python-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-steam() {
  depends=(python2 python2-six python2-cryptography python2-requests python2-gevent python2-protobuf python2-enum34 python2-pyaml python2-sphinx python2-vdf python2-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
