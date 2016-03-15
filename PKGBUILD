# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-prompt_toolkit
pkgver=0.60
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
md5sums=('516826aff6a09536037b6d02a9a3451d')
sha256sums=('b44acc4cf3fb9f7331343ae170eac06f853a66e28cdd4ccfeee7c8dad0dec33d')
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
