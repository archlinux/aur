# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.7
pkgrel=3
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-maturin)
source=("https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
sha256sums=('f567580173c45b4aa81416f4f6d9565ecfcfbf92f6cffb62ac387e7e46ba9dae')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
