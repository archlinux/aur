# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-cachetools
pkgver=1.1.3
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tkem/cachetools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('5d13913f1d16e744bb4327fd8870474b')
sha256sums=('405888e7290868094db3fa04c501ad1df0a346078ed18308ca2b22754bc7474b')

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
