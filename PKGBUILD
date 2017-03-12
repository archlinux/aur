# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pylru
pkgver=1.0.9
pkgrel=1
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/c0/7d/0de1055632f3871dfeaabe5a3f0510317cd98b93e7b792b44e4c7de2b17b/pylru-1.0.9.tar.gz)
md5sums=('41369d58a1c4391c5cc36f84262abcdc')
sha256sums=('71376192671f0ad1690b2a7427d39a29b1df994c8469a9b46b03ed7e28c0172c')

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
