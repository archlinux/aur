# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-prompt_toolkit
pkgver=0.58
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
md5sums=('158cff2aa0a82e9c08ece1f6b3522c67')
sha256sums=('11b5109858bf5480a4823f1d5f4c3e45e97e6f3d1c2024b06f54ca73314eaca3')
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
