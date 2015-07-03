# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit
pkgver=0.42
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
md5sums=('9f690402394e0d6db52773c0a26bcf30')
sha256sums=('064184bdc0f040cc7c9fae3715e346112f9d632a292601d5c383cedf3de7de12')
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
