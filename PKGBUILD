# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=steam
pkgname=(python-steam-git python2-steam-git)
pkgver=0.8.20.r37.f2aae35
pkgrel=1
pkgdesc='Module for interacting with various Steam features'
arch=('any')
url='https://github.com/ValvePython/steam'
license=('MIT')
depends=()
makedepends=(python-setuptools)
checkdepends=(python python-nose python-coverage python-mock python-vcrpy python2 python2-nose python2-coverage python2-mock python2-vcrpy)
source=("git://github.com/ValvePython/steam")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
  python2 setup.py test
}

package_python-steam-git() {
  depends=(python python-six python-cryptography python-requests python-gevent python-protobuf python-pyaml  python-sphinx python-vdf python-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-steam-git() {
  depends=(python2 python2-six python2-cryptography python2-requests python2-gevent python2-protobuf python2-enum34 python2-pyaml python2-sphinx python2-vdf python2-gevent-eventemitter-git)
  cd "$srcdir/$_pkgname"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
