# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rollbar
pkgver=0.11.0
pkgrel=1
pkgdesc="Logs exceptions and other data to Rollbar"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-setuptools')
url="https://github.com/rollbar/pyrollbar"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('52afec0381a899bcbb0d61538e8b6d03')
sha256sums=('252937737e3fe390c5a238efa928f5f653dfb198155a072805d584937fc6ed28')
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
