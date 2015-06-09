# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-tendo
pkgver=0.2.7
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools' 'python2-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('8a2ecd3fa27c8c2e03ed55c373d4b66d')
sha256sums=('573f350e48e8024c6c6c51ebff6217169bcff3a42e3588c4ede3f87d508157bf')

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
