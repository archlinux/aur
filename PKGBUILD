# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=3.3
pkgrel=1
pkgdesc="Colored stream handler for the logging module"
arch=('any')
depends=('python2' 'python2-humanfriendly')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-coloredlogs"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('856546014a349e6c3e0654f20049a778')
sha256sums=('64ab2264cd3fb95f0bab565aa80e660d436c4c7f724db13f33be497d79c13398')
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
