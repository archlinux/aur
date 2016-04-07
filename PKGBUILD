# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgbase=python2-leap_$_srcname
pkgname=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.7.4
pkgrel=1
pkgdesc='Synchronization Of Locally Encrypted Data Among Devices.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-u1db'
  'python2-oauth'
  'python2-leap_pycommon')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('bcf054e0d923fc73aff72d667ed336edbc92378fe6006b7692f6b8aa4ef5b93f')

package_python2-leap_soledad_common() {
  cd "$srcdir/$_srcname-$pkgver/common"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python2-leap_soledad_client() {
  depends=(
    'python2-pysqlcipher'
    'python2-scrypt'
    'pycryptopp'
    'python2-cchardet'
    'python2-zope-proxy'
    'python2-twisted'
    'python2-leap_soledad_common')

  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
