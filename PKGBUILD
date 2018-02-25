# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=steam
pkgname=(python-steam python2-steam)
pkgver=0.8.20
pkgrel=1
pkgdesc='Module for interacting with various Steam features'
arch=('any')
url='https://github.com/ValvePython/steam'
license=('MIT')
depends=()
makedepends=(python-setuptools)
checkdepends=(python python2 python-nose python-coverage python-mock python2-nose python2-coverage python2-mock)
source=("https://github.com/ValvePython/steam/archive/v$pkgver.tar.gz")
sha256sums=('32a3c75949817bd76d614cfc69e92c9b4cf68461275e306aeee5e043558cd4d8')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
  python2 setup.py test
}

package_python-steam() {
  depends=(python python-six python-cryptography python-requests python-gevent python-protobuf python-pyaml python-vcrpy python-sphinx python-vdf python-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-steam() {
  depends=(python2 python2-six python2-cryptography python2-requests python2-gevent python2-protobuf python2-enum34 python2-pyaml python2-vcrpy python2-sphinx python2-vdf python2-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
