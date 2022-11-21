# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python38-arrow
pkgver=1.2.3
pkgrel=1
pkgdesc='Better dates and times for Python'
arch=(any)
url=https://arrow.readthedocs.io
license=(APACHE)
depends=(python38-dateutil)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(python38-tox)
_tag=8842f8c3263d1f1219c189a0500aa67abdd0a214
source=(git+https://github.com/crsmithdev/arrow.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd arrow

  git describe --tags
}

build() {
  cd arrow

  python3.8 setup.py build
}

check() {
  cd arrow

  tox -e py310
}

package() {
  cd arrow

  python3.8 setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
