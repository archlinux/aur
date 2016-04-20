# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_mail
pkgname=python2-$_srcname
pkgver=0.4.1
pkgrel=1
pkgdesc='The magick sauce for leap encrypted email!'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-zope-interface'
  'python2-twisted'
  'python2-zope-proxy'
  'python2-service-identity'
  'python2-leap_pycommon'
  'python2-leap_soledad_client'
  'python2-leap_keymanager')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('a7dd17f6e8209bdc66ba2148fad8a88340e86b87d6b136da461490b3c5277848')

prepare() {
  cd "$srcdir/$_srcname-$pkgver"
  # Workaround changelog find fail
  sed -i 's/CHANGELOG/CHANGELOG.rst/' setup.py
}

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
