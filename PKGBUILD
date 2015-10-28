# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=3.1.3
pkgrel=1
pkgdesc="Colored stream handler for the logging module"
arch=('any')
depends=('python2' 'python2-humanfriendly')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-coloredlogs"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('f89d0f1d8e53ef39300ecfe511f8d1e5')
sha256sums=('d2195daa0e310bfaaf3dae47e22feaa3ee3631885e2ffc19aa765ad02196bf03')
provides=('coloredlogs' 'python2-coloredlogs')
conflicts=('coloredlogs')

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
