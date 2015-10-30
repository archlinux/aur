# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ptpython
pkgver=0.25
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
md5sums=('d255428fcb751a8ce1be477866d03358')
sha256sums=('6df30f3cde8db140daaf0243b54030e9d9acece8c2c424215edd90d437c257ae')
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
