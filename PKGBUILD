# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-prompt_toolkit
pkgver=0.46
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python"
arch=('any')
depends=('python'
         'python-pygments'
         'python-six'
         'python-wcwidth')
makedepends=('python-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('086d43d6e14bbfbbf0141d0144d5bf1c')
sha256sums=('1aa25cb9772e1e27d12f7920b5a514421ab763231067119bbd2f8b1574b409fb')
conflicts=('python-prompt-toolkit')

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
