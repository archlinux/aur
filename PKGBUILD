# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.3
pkgrel=1
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL3)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-maturin)
source=("https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
sha256sums=('eaa08b9b81d339d339c733a57fd112b82858c530f34b2cfaf5add37b877a9011')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
