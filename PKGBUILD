# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ptpython
pkgver=0.34
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
source=(https://pypi.python.org/packages/39/cc/5cd0ff55d774fd287bf3f07fd5ed57c25117b68fa3d7fc7a9649d9b3a02d/ptpython-0.34.tar.gz)
md5sums=('80d3601924a61af755c1e024205851d8')
sha256sums=('23ccb0e9f28cfc8001b9db4cfd0193862e56f8e9c21425fea91059e0be8fabd6')
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
