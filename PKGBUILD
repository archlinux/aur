# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysha3
pkgver=0.3
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/tiran/pykeccak"
license=('PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('150ef07e47b6ef79bdf7717036ceccc7')
sha256sums=('191c5f1f77de11fb847c6c825b72f33c81ce67f72055038175fccbbeb891f04d')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
