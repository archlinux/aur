# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=keymanager
pkgname=python2-leap_$_srcname
pkgver=0.5.1
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
  'python2-leap_pycommon'
)
#checkdepends=(
#  'python2-mock'
#  'python2-setuptools_trial'
#)
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha512sums=('ab366ae6f0fa1234244929d68baed67eb4ec6b59b626dc7b634f3f31a6b13cfe6a3a13907c097e378dd41ff6d302dab1210123bca6aaff1af7ae9ee521c97482')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

# Disable tests until pep8 sorts itself out
#check() {
#  cd "$srcdir/$_srcname-$pkgver"
#  trial leap.keymanager
#}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
