# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-google-generativeai
pkgver=0.8.4
pkgrel=1
pkgdesc="Google AI Python SDK for the Gemini API"
arch=('any')
url="https://github.com/google-gemini/generative-ai-python"
license=('Apache')
makedepends=('python-setuptools')
source=("generative-ai-${pkgver}.tar.gz::https://github.com/google-gemini/generative-ai-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6f99187ef7073b357b75daa437b02e90b1f9a9730b716121ae5b2c96f6b2c01')

# Dependencies listed in https://github.com/google-gemini/generative-ai-python/blob/main/setup.py#L44-L53
depends=('python-google-ai-generativelanguage=0.6.10' 'python-google-api-core' 'python-google-api-python-client' 'python-google-auth>=2.15.0' 'python-protobuf' 'python-pydantic' 'python-tqdm' 'python-typing_extensions')

build() {
  cd "generative-ai-python-${pkgver}"
  python setup.py build
}

package() {
  cd "generative-ai-python-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
