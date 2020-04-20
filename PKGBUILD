# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-bigquery

pkgname=python-google-cloud-bigquery
pkgver=1.24.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://pypi.org/project/google-cloud-bigquery/"
license=('APACHE')
depends=(
  'python-google-auth>=1.9.0'
  'python-google-api-core>=1.15.0'
  'python-google-cloud-core>=1.1.0'
  'python-google-resumable-media>=0.5.0'
  'python-protobuf>=3.6.0'
  'python-six>=1.13.0'
)
makedepends=('python-setuptools')
optdepends=(
  'python-arrow>0.14.0: for pyarrow support'
  'python-pandas>=0.17.1: for pandas support'
  'python-tqdm>=4.0.0: for tqdm support'
  'python-fastparquet: for fastparquet support'
  'python-snappy: for fastparquet support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '7ffcceed8becea20cb4ce4bdf9b924822780416ff1a9d497f9a1238a3f1442b1'
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
