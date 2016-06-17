# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-base58
pkgver=0.2.3
pkgrel=1
pkgdesc="Bitcoin-compatible Base58 and Base58Check implementation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/base58"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/32/8c/9b8b1b8364a945fa1ed4308d650880a5eb77bd08c2086e32e1f608440ed8/base58-0.2.3.tar.gz)
md5sums=('53c7e18f9a470c3fdad3e7ba69e70bf5')
sha256sums=('a691b5d194617a3de401aa2ed8818f12f1e348e95524f74a9c67246b59368fff')
provides=('base58-py2' 'python2-base58')
conflicts=('base58-py2')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming binary...'
  mv "$pkgdir/usr/bin/base58" "$pkgdir/usr/bin/base58-py2"
}
