# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rfc3986
pkgver=0.2.1
pkgrel=1
pkgdesc="Parsing and validation of URIs (RFC 3896)"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/rfc3986"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('84151eec209c99e71edc760745510da4')
