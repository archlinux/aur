# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rollbar
pkgver=0.11.1
pkgrel=1
pkgdesc="Logs exceptions and other data to Rollbar"
arch=('any')
depends=('python2' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/rollbar/pyrollbar"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('134d54a87d8be31cec2c5fa14316121c')
sha256sums=('1c24c6a8f9c2f402e318df3d84cff67ac0654b554beb0e4384134bf3e84ea186')
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
