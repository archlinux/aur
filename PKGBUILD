# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

pkgname=bitmask_client
pkgver=0.9.1
pkgrel=1
pkgdesc='Encrypted communication for mere mortals.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-argh'
  'python2-requests'
  'python2-srp'
  'python2-pyopenssl'
  'python2-coloredlogs'
  'python2-psutil'
  'python2-ipaddr'
  'python2-twisted'
  'python2-daemon=1.6.1'
  'python2-keyring'
  'python2-zope-proxy'
  'python2-pyzmq'
  'python2-txzmq'
  'python2-oauth'
  'python2-logbook'
  'python2-pyside'
  'python2-leap_soledad_client'
  'python2-leap_keymanager'
  'python2-leap_mail'
  'python2-leap_pycommon')
makedepends=(
  'python-pyside-tools')
source=("https://github.com/leapcode/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7e907adeef60c61378c505d29f69d1cf777495215b356ce7ea3b0dc2b5c70dab')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Install to /usr/bin instead of /usr/sbin
  sed -i 's/sbin/bin/' setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Qt
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
