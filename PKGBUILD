# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-strict-rfc3339
pkgver=0.7
pkgrel=1
pkgdesc="Strict, simple, lightweight RFC3339 functions"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.danielrichman.co.uk/libraries/strict-rfc3339"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/56/e4/879ef1dbd6ddea1c77c0078cd59b503368b0456bcca7d063a870ca2119d3/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('4d9b635b4df885bc37bc1189d66c9abc')
sha256sums=('5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277')

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
