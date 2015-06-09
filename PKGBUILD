# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-aniso8601
pkgver=1.0.0
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('de0dcc6c74613e3efbfcc95e7dcff335')
sha256sums=('f0bf0108bb24f7c7cb0b0408721a52bee9ac2fd838082c135cd8da87f4d951f4')

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
