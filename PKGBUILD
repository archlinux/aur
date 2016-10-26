# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=python-blitzdb
pkgver=0.3.3
pkgrel=1
pkgdesc="A document-oriented database written purely in Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/adewes/blitzdb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/3c/7f/52906526e58705c42261916cdc11c67f099dd6543c74d4a88a58a0015e86/blitzdb-0.3.3.tar.gz)
md5sums=('fd7615fb2665e81d0909f860d4e50034')
sha256sums=('d6090dad0cefd1276f776c0fb3df79becf90ca1153a667e3ced6b7739eb0e222')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/lib/python3.5/site-packages/blitzdb/tests"
}
