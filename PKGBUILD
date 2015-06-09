# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tendo
pkgver=0.2.7
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'python-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('8a2ecd3fa27c8c2e03ed55c373d4b66d')
sha256sums=('573f350e48e8024c6c6c51ebff6217169bcff3a42e3588c4ede3f87d508157bf')

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
