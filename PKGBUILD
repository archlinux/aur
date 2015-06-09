# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-strict-rfc3339
pkgver=0.5
pkgrel=1
pkgdesc="Strict, simple, lightweight RFC3339 functions"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.danielrichman.co.uk/libraries/strict-rfc3339"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('00a51064d1bbc49566ce471c39325906')
sha256sums=('a5e891e5669ddeff5fb1d2d006c96858e3ecfac180eb9a4efa9b019655f12518')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
