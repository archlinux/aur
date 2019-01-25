# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=google-cloud-bigquery

pkgname=python-google-cloud-bigquery
pkgver=1.8.1
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://pypi.org/project/google-cloud-bigquery/"
license=('APACHE')
depends=(
  'python-google-api-core>=1.6.0'
  'python-google-cloud-core>=0.29.0'
  'python-google-resumable-media>=0.3.1'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/ea/b5/597481ab940882959ffc902f3c8f288334d7881d9b5046dee6f8afb78ab2/google-cloud-bigquery-${pkgver}.tar.gz"
)
sha256sums=(
  '621e05321d7a26b87fa2d4f8dd24f963d3424d7566a6454d65c4427b9d8552e2'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
