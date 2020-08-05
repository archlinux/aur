# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-tflite
_pkgname=tflite
pkgver=2.3.0
pkgrel=1
pkgdesc="Parse TFLite models (*.tflite) EASILY with Python"
arch=("any")
url="https://github.com/jackwish/tflite"
license=('Apache')
depends=('python-flatbuffers')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e0a39b9a2f4fef3e584ccc2785f5364ef21c6a01fa672ab0587dc2d296204837')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
