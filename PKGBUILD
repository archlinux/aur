# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-characters
pkgver=0.1.0
pkgrel=1
pkgdesc="Tools for manipulating characters, strings, and character sets"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/halfmoonlabs/characters"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('9406a608b83c75ef318d442f7727779f')
sha256sums=('cbd749d58de6ce9b116d189853430ae2c58b954a5375acc325d1960a436dd8f2')

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
