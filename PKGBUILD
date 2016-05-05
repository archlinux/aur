# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ptpython
pkgver=0.33
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
source=(https://pypi.python.org/packages/46/68/aeff7b6e1ed9e519eb2ef11fa78cc73e04a27b08f69f3c8ea23fc30736d4/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('52c0e13ffe8d60d49b7636ac0d3d2aef')
sha256sums=('86bb8bc6b3b2e4c7d4b400867d53fd94ffc4fe029d146f7a54d4e53160479435')
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
