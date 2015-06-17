# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit
pkgver=0.40
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
md5sums=('d0b590999ec01f861f3366fa053b3032')
sha256sums=('b2a54a880b7460703c4dc97225c0853486132997e76d19af82ed4eb6ee17d77f')
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
