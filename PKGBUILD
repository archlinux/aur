# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rollbar
pkgver=0.11.4
pkgrel=1
pkgdesc="Logs exceptions and other data to Rollbar"
arch=('any')
depends=('python2' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/rollbar/pyrollbar"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('ae26c021a25ce15778e95b6fcca45da6')
sha256sums=('17298407ddc628232ef58c6d0ad99695633da79aaa7e5496b564b8a0ad230f2f')
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
