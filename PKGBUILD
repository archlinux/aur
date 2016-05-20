# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rfc3987
pkgver=1.3.6
pkgrel=1
pkgdesc="Parsing and validation of URIs (RFC 3896) and IRIs (RFC 3987)"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/dgerber/rfc3987"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/14/65/b414c853e8d02a1011ef7587d1bd43478f87a2d58f127a4c794e1f778de1/rfc3987-1.3.6.tar.gz)
md5sums=('da7dabf5ee0b1426a2c6c4f8406ee0d3')
sha256sums=('599801156e35b5054138585c92ab4d1b729b0f2feeb961b65347116764df4aa7')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
