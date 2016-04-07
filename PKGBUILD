# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_srcname=python-daemon
pkgname=python2-daemon16
pkgver=1.6.1
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process.'
arch=('any')
url="https://pypi.python.org/pypi/$_srcname"
license=('Apache')
depends=('python2-lockfile')
makedepends=('python2-setuptools' 'python2-docutils')
provides=('python2-daemon=1.6.1')
conflicts=('python2-daemon')
source=("https://pypi.python.org/packages/source/p/python-daemon/python-daemon-$pkgver.tar.gz")
sha256sums=('99f886bbf0bfd6e144a06c59fe371e195a89aab93beb49979e6f10c3a271b077')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ASF-2"
  install -Dm644 LICENSE.GPL-3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3"
}
