# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-tflite
_pkgname=tflite
pkgver=2.2.0
pkgrel=1
pkgdesc="Parse TFLite models (*.tflite) EASILY with Python"
arch=("any")
url="https://github.com/jackwish/tflite"
license=('Apache')
depends=('python-flatbuffers')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b00b015ba139a83912be47c81a40def36d8f3617879b8c5e198663ec10fae56d')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
