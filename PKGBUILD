# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-resumable-media

pkgname=python-google-resumable-media
pkgver=1.0.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://pypi.org/project/google-resumable-media/"
license=('APACHE')
depends=(
  'python>=3.5'
  'python-google-crc32c>=1.0'
  'python-six'
)
makedepends=('python-setuptools')
optdepends=(
  'python-requests>=2.18.0: for requests support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '173acc6bade1480a529fa29c6c2717543ae2dc09d42e9461fdb86f39502efcf2'
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
