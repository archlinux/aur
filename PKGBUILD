# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-cachetools
pkgver=1.1.1
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tkem/cachetools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c8c005a588610cdfa4ad2c2115266d7c')
sha256sums=('f8eaf3530395d073e45dc031d5f51dad2863880a6a8318a7f01f8d7b30f7fd2e')

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
