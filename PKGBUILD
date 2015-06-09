# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pif
pkgver=0.7.1
pkgrel=1
pkgdesc="Public IP address checker"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-setuptools')
url="https://github.com/barseghyanartur/pif"
license=('custom')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b63a5aa7cd231a7dcea42da3cac8d625')
sha256sums=('353191326f099cd40ddfa90864f65382ddb20101768f74649eba32c8d13156c4')

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
