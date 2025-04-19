# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-google-generativeai
pkgver=0.8.5
pkgrel=3
pkgdesc="Google AI Python SDK for the Gemini API"
arch=('any')
url="https://github.com/google-gemini/generative-ai-python"
license=('Apache-2.0')
makedepends=('python-setuptools')
source=("generative-ai-${pkgver}.tar.gz::https://github.com/google-gemini/generative-ai-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2baa9b7cda3df8d9ca609b0eeac404e697bf0d046294becc5d90aa5b30c4c272')

# Dependencies listed in https://github.com/google-gemini/generative-ai-python/blob/main/setup.py#L44-L53
depends=('python-google-ai-generativelanguage=0.6.10' 'python-google-api-core' 'python-google-api-python-client' 'python-google-auth>=2.15.0' 'python-protobuf' 'python-pydantic' 'python-tqdm' 'python-typing_extensions')

build() {
	cd "deprecated-generative-ai-python-${pkgver}"
	python setup.py build
}

package() {
	cd "deprecated-generative-ai-python-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
