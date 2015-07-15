# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ptpython
pkgver=0.17
pkgrel=1
pkgdesc="Interactive Python prompt with syntax highlighting and code completion"
arch=('any')
depends=('python'
         'python-docopt'
         'python-jedi'
         'python-prompt_toolkit')
makedepends=('python-setuptools')
optdepends=('ipython: ptipython')
url="https://github.com/jonathanslenders/ptpython"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('e74dc61dcd5ac315af7e65a45dc0b503')
sha256sums=('9b8ea4ad6e5a5a7c024018260b9a106c93833fe7adac46b834b4472da7008508')
provides=('ptpython' 'python-ptpython')
conflicts=('ptpython')

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
