# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-plyvel
pkgver=0.9
pkgrel=1
pkgdesc="A fast and feature-rich Python interface to LevelDB"
arch=('i686' 'x86_64')
depends=('leveldb' 'python')
makedepends=('cython' 'gcc' 'make' 'python-setuptools')
url="https://github.com/wbolster/plyvel"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('b0f768a07683dad01554b040c6320ed5')
sha256sums=('587d93681ae44936ae086b4b45486eb302e3853ba5af149aac3be9e9713998e9')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
