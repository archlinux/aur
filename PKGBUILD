# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core

pkgname=python-google-cloud-core
pkgver=1.3.0
pkgrel=1
pkgdesc="Google Cloud API client core library"
arch=('any')
url="https://pypi.org/project/google-cloud-core/"
license=('APACHE')
depends=(
  'python-google-api-core>=1.16.0'
)
makedepends=('python-setuptools')
optdepends=(
  'python-grpcio>=1.8.2: for grpc support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '878f9ad080a40cdcec85b92242c4b5819eeb8f120ebc5c9f640935e24fc129d8'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
