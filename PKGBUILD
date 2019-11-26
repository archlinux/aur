# Maintainer: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
_pkgname=bidi
pkgver=0.4.2
pkgrel=1
pkgdesc="BIDI algorithm related functions"
arch=('any')
makedepends=('python-setuptools')
depends=('python-wheel')
url="https://github.com/MeirKriheli/python-bidi"
license=('LGPL')
options=(!emptydirs)
source=(https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}.tar.gz)
md5sums=('52477f00edf4dfab666988d126684f86')

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
