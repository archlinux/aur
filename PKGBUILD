# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-google-generativeai
pkgver=0.7.2
pkgrel=1
pkgdesc="Google AI Python SDK for the Gemini API"
arch=('any')
url="https://github.com/google-gemini/generative-ai-python"
license=('Apache')
makedepends=('python-setuptools')
source=("generative-ai-${pkgver}.tar.gz::https://github.com/google-gemini/generative-ai-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5349509077b1442318587e4fe0c21763050bb44c3aa680c765dbc2754bc73d63')

build() {
  cd "generative-ai-python-${pkgver}"
  python setup.py build
}

package() {
  cd "generative-ai-python-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
