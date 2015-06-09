# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-utilitybelt
pkgver=0.2.6
pkgrel=1
pkgdesc="Miscellaneous Python utilities"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/onenameio/utilitybelt"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/u/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('0dcb26400774975a6fdd65e3b13b9bb3')
sha256sums=('dafdb6a2dbb32e71d67a9cd35afd7c2e4993ec094e7ddb547df4cf46788770a4')

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
