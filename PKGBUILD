# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-tendo
pkgver=0.2.8
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools' 'python2-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('df58b9fd3e6ee85d1a9502ddb209c6e5')
sha256sums=('823f75cbc1c3fe96a25e32a4ac315e0a70f440c844e5ba168cef0f11ca817a62')

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
