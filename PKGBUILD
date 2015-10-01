# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=python2-parsedatetime
pkgver=1.5
pkgrel=2
pkgdesc="Parse human-readable date/time strings."
arch=('any')
url='http://github.com/bear/parsedatetime'
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz")
sha256sums=('3da6be2be506f59cce32e19e30e201053e1bb4d07e25668918e00f8a49ad40ab')

prepare() {
  find ${pkgname#*-}-$pkgver -name '*.py' -type f \
    -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
  cd "${pkgname#*-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "${pkgname#*-}-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
