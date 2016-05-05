# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-prompt_toolkit
pkgver=1.0.0
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
source=(https://pypi.python.org/packages/0b/2c/ab26db81e5b9c2f179a2e9d797f2ce0d11f7cc3308830831de0daad8629e/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('922bfba0f0aff76d9d076a41b0b802a4')
sha256sums=('5108ed9e6e40d28cb1dc90ba563987859231289700d0def999007b08f4f74ea4')
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
