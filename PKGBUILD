# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-google-generativeai
pkgver=0.8.2
pkgrel=1
pkgdesc="Google AI Python SDK for the Gemini API"
arch=('any')
url="https://github.com/google-gemini/generative-ai-python"
license=('Apache')
makedepends=('python-setuptools')
source=("generative-ai-${pkgver}.tar.gz::https://github.com/google-gemini/generative-ai-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5647cef1cfce71e482a0b94f17f08aa46254a1b78425e2414fe10aac5150b68')

# Dependencies listed in https://github.com/google-gemini/generative-ai-python/blob/42d952a2429fa72c0f2617d71eb9aa3f708b6867/setup.py#L45C1-L53C1
depends=('python-google-ai-generativelanguage=0.6.9' 'python-google-api-core' 'python-google-api-python-client' 'python-google-auth>=2.15.0' 'python-protobuf' 'python-pydantic' 'python-tqdm' 'python-typing_extensions')

build() {
  cd "generative-ai-python-${pkgver}"
  python setup.py build
}

package() {
  cd "generative-ai-python-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
