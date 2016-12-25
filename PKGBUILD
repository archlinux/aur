# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysha3
pkgver=1.0.0
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/tiran/pykeccak"
license=('PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/1c/fd/ec5ebe88c71f04f71e8e4e50e0a037fa4975f70f508fd6e622b186831a28/pysha3-1.0.0.tar.gz)
md5sums=('dda7d6c10df9a7e3997894e1cc1e8197')
sha256sums=('2d2f681a6b1941ad1f778ad0ce69120389a456e0fe12623f16c15c517a1b9a95')

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
