# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-simpleconfig
pkgver=1.0
pkgrel=2
pkgdesc="Dead simple configuration file parser"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://kisom.github.io/pysimpleconfig/"
license=('ISC')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('3495309bc03a8a319ebdca7185ef5035')
sha256sums=('08d6f9d43a92f292bdb79a89b8a5cffa819bf76e6a2273af21ae8e2e29d2a885')
provides=('python2-simpleconfig' 'simpleconfig')
conflicts=('simpleconfig' 'pysimpleconfig')

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
