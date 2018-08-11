# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
_pkgname=bidi
pkgver=0.4.0
pkgrel=3
pkgdesc="BIDI algorithm related functions"
arch=('any')
makedepends=('python-setuptools')
depends=('python-wheel')
url="https://github.com/MeirKriheli/python-bidi"
license=('LGPL')
options=(!emptydirs)
source=(https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}.tar.gz)
md5sums=('74ec522efab0328e3471e58ab8007131')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
