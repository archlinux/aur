# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rfc3987
pkgver=1.3.5
pkgrel=1
pkgdesc="Parsing and validation of URIs (RFC 3896) and IRIs (RFC 3987)"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/dgerber/rfc3987"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('d129a862af0a4a096f0fc5fea8ed776d')
sha256sums=('ed37b839553370971a1d5cd53392206206c56ea550d435ef45e6d94e7df50697')

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
