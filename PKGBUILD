# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-genai
pkgname=python-${_name}
pkgver=1.2.0
pkgrel=1
pkgdesc="GenAI Python SDK."
arch=('any')
url='https://github.com/googleapis/python-genai/'
license=('Apache-2.0')
source=("https://github.com/googleapis/python-genai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4878440354a523c44c228b7d3039df3af99f3ed871b0db79b23b78adc23a1343')
depends=('python>=3.9' 'python-google-auth' 'python-pydantic' 'python-requests' 'python-websockets' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${pkgname//google-/}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${pkgname//google-/}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
