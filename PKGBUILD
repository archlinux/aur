# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-gevent-eventemitter
_name=${pkgname#python-}
pkgver=2.1
pkgrel=2
pkgdesc="EventEmitter using gevent"
arch=('any')
url="https://github.com/rossengeorgiev/gevent-eventemitter"
license=('unknown')
depends=('python' 'python-gevent')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec44e3a69c3eab31462babc089d6d650be49e5186258f6284e43b9c7398926b1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  make test
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
