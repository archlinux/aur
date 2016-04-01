# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-cachetools
pkgver=1.1.6
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tkem/cachetools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('387d7f34effd9335ae55bd0762e77bfa')
sha256sums=('d1a44ffd2eedd138f3ba69038feb807ea54cb24e8a207a52d3a8603bc4961821')

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
