# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=python2-translitcodec
pkgver=0.4.0
pkgrel=1
pkgdesc="Unicode to 8-bit charset transliteration codec"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/claudep/translitcodec"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('7fd31bd3f792982a7919ab131ac848cf')
sha256sums=('715a8995f84482cd23c1b02fd254ff4da66589e9d5222de10f7efe49d7bea683')

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
