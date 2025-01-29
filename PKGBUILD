# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-tflite
_pkgname=tflite
pkgver=2.18.0
pkgrel=1
pkgdesc="Parse TFLite models (*.tflite) EASILY with Python"
arch=("any")
url="https://github.com/jackwish/tflite"
license=('Apache')
depends=('python-flatbuffers')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('b4c6479ce750af9a47a7ad2d404af78a23fb29ff525298fa120a090227076b0d7f3d066ce91498c87d5276657069a4d802e1150a40795e668f447118c36cc50d')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
