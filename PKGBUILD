# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ptpython
pkgver=0.21
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
md5sums=('d47bd868a3474b4f74413dcab19f7b4c')
sha256sums=('37aad517cf9d55e567697fe001bc2d07e7013753218537f78425c2bac1181a0b')
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
