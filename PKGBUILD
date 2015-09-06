# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit
pkgver=0.50
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python"
arch=('any')
depends=('python2'
         'python2-pygments'
         'python2-six'
         'python2-wcwidth')
makedepends=('python2-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('e476d5d9cf67f93f01a84b7a525fe0b5')
sha256sums=('6acd7c7d158b1dfb5907659abfae0cee2e5354fabc943aed411843d7fb2bd4aa')
conflicts=('python2-prompt-toolkit')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
