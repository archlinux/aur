# $Id: PKGBUILD 224114 2017-04-21 12:52:56Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=python2-sensors
_pkgname=PySensors
pkgver=0.0.3
pkgrel=2
pkgdesc='Python bindings to libsensors'
arch=('any')
url='http://pypi.python.org/pypi/PySensors/'
license=('GPL')
depends=('python2' 'lm_sensors')
source=(https://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b735dada5318ce50f2d141d29b102e7a116a5934509583f86302d4b59399e961')

prepare() {
  sed -i 's/env python/env python2/' "$srcdir/$_pkgname-$pkgver/sensors/"*.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install -O1 --prefix='/usr' --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
