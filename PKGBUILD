# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-tflite
_pkgname=tflite
pkgver=2.10.0
pkgrel=1
pkgdesc="Parse TFLite models (*.tflite) EASILY with Python"
arch=("any")
url="https://github.com/jackwish/tflite"
license=('Apache')
depends=('python-flatbuffers')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e77d131ed3d10a8f3b0e3ff845a6985b3b8b90ff8426b2e2336ea52e811ea9ff')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
