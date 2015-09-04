# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rollbar
pkgver=0.9.14
pkgrel=1
pkgdesc="Logs exceptions and other data to Rollbar"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-setuptools')
url="https://github.com/rollbar/pyrollbar"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('74c2ba5f97758270d8f4890b29ef1a59')
sha256sums=('87fbefa5e05fc452640543a79300344021fac402de346525987ead1166aca296')
provides=('pyrollbar' 'python2-rollbar' 'rollbar')
conflicts=('pyrollbar' 'rollbar')

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
