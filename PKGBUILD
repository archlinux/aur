# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-strict-rfc3339
pkgver=0.6
pkgrel=1
pkgdesc="Strict, simple, lightweight RFC3339 functions"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.danielrichman.co.uk/libraries/strict-rfc3339"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('308a4bfce4930e69526d0770116cdc12')
sha256sums=('8d505093cff2a65144eecee09a171ec3401a4d725438381c22011eceddf549df')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
