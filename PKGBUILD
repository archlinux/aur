# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.6
pkgrel=1
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL3)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-maturin)
source=("https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
sha256sums=('c89a61c1534f47656bec240e9fab62a96908fa8dcbd01cdb684a577e9f4386ac')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
