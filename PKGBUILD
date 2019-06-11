# Maintainer:
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=python2-dbusmock
pkgver=0.18.2
pkgrel=1
pkgdesc="Mock D-Bus objects for tests"
url="https://github.com/martinpitt/python-dbusmock"
arch=(any)
license=(LGPL3)
depends=(python2-dbus python2-gobject)
makedepends=(python2-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/martinpitt/python-dbusmock/archive/$pkgver.tar.gz")
sha256sums=('c049f75320eb4c161fd0c5c9ec673d7caf13ff69fb494e52362b2d684ec2bd52')

build() {
  cd ${pkgname/2}-$pkgver
  python2 setup.py build
}

package() {
  cd ${pkgname/2}-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
