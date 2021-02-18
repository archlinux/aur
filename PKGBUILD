# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-resumable-media

pkgname=python-google-resumable-media
pkgver=1.2.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://pypi.org/project/google-resumable-media/"
license=('APACHE')
depends=(
  'python>=3.6'
  'python-google-crc32c>=1.0'
  'python-six'
)
makedepends=('python-setuptools')
optdepends=(
  'python-requests>=2.18.0: for requests support'
  'python-aiohttp>=3.6.2: for aiohttp support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  'ee98b1921e5bda94867a08c864e55b4763d63887664f49ee1c231988f56b9d43'
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
