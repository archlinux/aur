# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rfc3987
pkgver=1.3.4
pkgrel=1
pkgdesc="Parsing and validation of URIs (RFC 3896) and IRIs (RFC 3987)"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/dgerber/rfc3987"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('40218a2f7c5c04c46ac03da73b27ee18')
sha256sums=('8bdd8bf28431bae754d34d60a23ca37aefa2cf8ade2de4a0e9d86e4a688b0c2e')

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
