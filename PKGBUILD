# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-core

pkgname=python-google-cloud-core
pkgver=1.7.1
pkgrel=1
pkgdesc="Google Cloud API client core library"
arch=('any')
url="https://pypi.org/project/google-cloud-core/"
license=('APACHE')
depends=(
  'python>=3.6'
  'python-google-api-core>=1.21.0'
  'python-google-auth>=1.24.0'
  'python-six>=1.12.0'
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
  '3bd1e679a3d38b9da93c5919ae56239dda91fb32a2d954b2cd830392337c1cc9'
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
