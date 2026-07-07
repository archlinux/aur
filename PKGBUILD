# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.11
pkgrel=1
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL-3.0-or-later)
arch=('x86_64' 'aarch64')
depends=(python)
makedepends=(python-build python-maturin python-installer)
source=("${url}/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
b2sums=('fe622471c9ec4eb070619760b708adb386e2825208550e3f1ecf849b09c21a2171bf53962f6ee02b89e37b3d4a9db8f1a09b3f1aff06a5a9143de7611d156d34')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
