# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-resumable-media

pkgname=python-google-resumable-media
pkgver=0.5.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://pypi.org/project/google-resumable-media/"
license=('APACHE')
depends=(
  'python-six'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '2a8fd188afe1cbfd5998bf20602f76b0336aa892de88fe842a806b9a3ed78d2a'
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
