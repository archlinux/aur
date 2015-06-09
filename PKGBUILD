# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit
pkgver=0.39
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
md5sums=('67fbbb83fefd9f188d314d384dcddb9f')
sha256sums=('8b924453f9a79789608ce72190cf519ccdd7d9e79d7ddf910d2784861f748680')
conflicts=('python2-prompt-toolkit')

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
