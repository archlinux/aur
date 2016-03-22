# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rollbar
pkgver=0.11.5
pkgrel=1
pkgdesc="Logs exceptions and other data to Rollbar"
arch=('any')
depends=('python2' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/rollbar/pyrollbar"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('c104316100061f32a906e09d353094a0')
sha256sums=('b2ecbcc84f21436de404bad68012fe9fcc4709aa4b0ce613d3df7f4e605f4c71')
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
