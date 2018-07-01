# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-httpsig_cffi
_pyname=httpsig_cffi
pkgver=15.0.0
pkgrel=1
pkgdesc='Sign HTTP requests with secure signatures according to the IETF HTTP Signatures specification using Cryptography'
arch=('any')
url='https://github.com/hawkowl/httpsig_cffi'
license=('MIT')
depends=('python' 'python-six' 'python-cryptography')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d3d700429c4672a87c149e0be4248ec1e5898d689feb9e959529f0d32df72c3f')

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
