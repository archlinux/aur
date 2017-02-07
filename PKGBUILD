# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysha3
pkgver=1.0.2
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/tiran/pykeccak"
license=('PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/73/bf/978d424ac6c9076d73b8fdc8ab8ad46f98af0c34669d736b1d83c758afee/pysha3-1.0.2.tar.gz)
md5sums=('59cd2db7a9988c1f3f6aee40145e0c96')
sha256sums=('fe988e73f2ce6d947220624f04d467faf05f1bbdbc64b0a201296bb3af92739e')

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
