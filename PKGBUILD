# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-logzero
pkgver=1.7.0
pkgrel=1
pkgdesc="Robust and effective logging for Python"
arch=(x86_64)
url="https://github.com/metachris/logzero"
license=(MIT)
depends=(
python
)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/metachris/logzero/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('ff5d91754ebd6e822553dbfa8179e7ed3d4de3ba3505d03394d7db2bdab515ce')

prepare() {
  cd logzero-${pkgver}
}

build() {
  cd logzero-${pkgver}
  python setup.py build
}

package() {
  cd logzero-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}

