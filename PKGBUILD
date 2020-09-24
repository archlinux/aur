# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-bigquery

pkgname=python-google-cloud-bigquery
pkgver=1.28.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://pypi.org/project/google-cloud-bigquery/"
license=('APACHE')
depends=(
  'python>=3.5'
  'python-google-api-core>=1.21.0'
  'python-google-cloud-core>=1.4.1'
  'python-google-resumable-media>=0.6.0'
  'python-six>=1.13.0'
)
makedepends=('python-setuptools')
optdepends=(
  'python-arrow>=1.0.0: for pyarrow support'
  'python-pandas>=0.23.0: for pandas support'
  'python-tqdm>=4.7.4: for tqdm support'
  'python-fastparquet: for fastparquet support'
  'python-snappy: for fastparquet support'
  'python-llvmlite: for fastparquet support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '9784cff71d6a46ce202748169f9c7e38fc99d6babbb2f3cdc540475d11f572b9'
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
