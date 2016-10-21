# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-aniso8601
pkgver=1.2.0
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python' 'python-dateutil')
makedepends=('python-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/5b/fb/251a0dd2f4710e60664ddd8bd3485bd8362530f47af9e88f4061fe589ebf/aniso8601-1.2.0.tar.gz)
md5sums=('bb678d20e4b2c701d7c38a7fc4b7cff5')
sha256sums=('502400f82574afa804cc915d83f15c67533d364dcd594f8a6b9d2053f3404dd4')

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
