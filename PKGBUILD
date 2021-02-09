# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-tflite
_pkgname=tflite
pkgver=2.4.0
pkgrel=1
pkgdesc="Parse TFLite models (*.tflite) EASILY with Python"
arch=("any")
url="https://github.com/jackwish/tflite"
license=('Apache')
depends=('python-flatbuffers')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-install')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0b911b8e3fd7eef0052ad91f0221cef3d20a25f8bdd5c629c5c1d426c0426e3d')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  python -m install --cache dist/*.whl
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m install --destdir="$pkgdir" --skip-build --verify-dependencies
}
