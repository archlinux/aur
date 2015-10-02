# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-prompt_toolkit
pkgver=0.52
pkgrel=2
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
md5sums=('a96bf7f1880fb12e65306dec7f000b1f')
sha256sums=('35b8a34df8dea4cba92222dc1b8700c30ed7a8ba47cf3bc583768c5571a30902')
conflicts=('python-prompt-toolkit')

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
