# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-aniso8601
pkgver=1.0.0
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('de0dcc6c74613e3efbfcc95e7dcff335')
sha256sums=('f0bf0108bb24f7c7cb0b0408721a52bee9ac2fd838082c135cd8da87f4d951f4')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
