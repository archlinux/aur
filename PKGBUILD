# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=google-cloud-core

pkgname=python-google-cloud-core
pkgver=0.29.1
pkgrel=1
pkgdesc="Google Cloud API client core library"
arch=('any')
url="https://pypi.org/project/google-cloud-core/"
license=('APACHE')
depends=(
  'python-google-api-core>=1.0.0'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/8f/79/aba910c76b12c13e31be779bb580556757b47ee331efc10e30c4785a2156/google-cloud-core-${pkgver}.tar.gz"
)
sha256sums=(
  'd85b1aaaf3bad9415ad1d8ee5eadce96d7007a82f13ce0a0629a003a11e83f29'
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
