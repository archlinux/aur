# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tendo
pkgver=0.2.8
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'python-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('df58b9fd3e6ee85d1a9502ddb209c6e5')
sha256sums=('823f75cbc1c3fe96a25e32a4ac315e0a70f440c844e5ba168cef0f11ca817a62')

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
