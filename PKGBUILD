# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-aniso8601
pkgver=1.1.0
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python2' 'python2-dateutil')
makedepends=('python2-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('d2610ecaab3bdfe51f74678c89c69cf7')
sha256sums=('4fc462db59811f541bc25d865b86367153d8ce773ae75b16d54e2e1cd393b5cc')

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
