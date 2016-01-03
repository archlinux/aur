# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit
pkgver=0.56
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
md5sums=('c369c0797d627874c8839701d2d36450')
sha256sums=('4e61f73d2f43f92744365f0a2767ca8c77973b6f48f74f5cbb3256f26007d435')
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
