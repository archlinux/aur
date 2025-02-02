# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-genai
pkgname=python-${_name}
pkgver=0.8.0
pkgrel=1
pkgdesc="Google Gen AI Python SDK provides an interface for developers to integrate Google's generative models into their Python applications."
arch=('any')
url='https://github.com/googleapis/python-genai/'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('b5730bcb144177cfcf6cfe44ab59611f8dec3f7c44599cfb321d5d71856a910e')
depends=('python>=3.9' 'python-google-auth' 'python-pydantic' 'python-requests' 'python-websockets')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
