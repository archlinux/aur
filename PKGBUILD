# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_mail
pkgname=python2-$_srcname
pkgver=0.4.2
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
  'python2-leap_keymanager'
)
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha512sums=('6abcc10bafb7b918bb80808f11de5a388c43321c0acac0d8fd9b1cce98a4933bc6ed0c33d001a3bea6c7e93c8d6e09c3c6413ea4eeaa2372766daa9d7f8c441f')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
