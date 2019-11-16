# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-api-core
_sha256sum=df8adc4b97f5ab4328a0e745bee77877cf4a7d4601cb1cd5959d2bbf8fba57aa

pkgname=python-google-api-core
pkgver=1.14.3
pkgrel=2
pkgdesc="Google API client core library"
arch=('any')
url="https://pypi.org/project/google-api-core/"
license=('APACHE')
depends=(
  'python>=3.4'
  'python-googleapis-common-protos>=1.6.0'
  'python-protobuf>=3.4.0'
  'python-google-auth>=0.4.0'
  'python-requests>=2.18.0'
  'python-setuptools>=34.0.0'
  'python-six>=1.10.0'
  'python-pytz'
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
  "${_sha256sum}"
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
