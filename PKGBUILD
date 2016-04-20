# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=keymanager
pkgname=python2-leap_$_srcname
pkgver=0.5.0
pkgrel=1
pkgdesc='Python nicknym agent.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  # There are multiple versions of these, we want the newer fork
  'python2-gnupg-ng-leap'
  'python2-simplejson'
  'python2-requests'
  'python2-leap_pycommon')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('797acd854093122a88fdd96451145fa143e733e03105dd43e441c10b8b93a2ec')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
