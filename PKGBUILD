# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=2.0
pkgrel=1
pkgdesc="Colored stream handler for the logging module"
arch=('any')
depends=('python2' 'python2-humanfriendly')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-coloredlogs"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b141af3a72e774e488232062145c7222')
sha256sums=('532198042eac7560f5292961bfb6f844343132fda805575684f67deeb780b2c2')
provides=('ansi2html' 'python2-coloredlogs')
conflicts=('ansi2html')

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
