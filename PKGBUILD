# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-llm-ollama"
_name=${pkgname#python-}
pkgver="0.14.0"
pkgrel=1
pkgdesc="LLM plugin providing access to models running on an Ollama server"
arch=("any")
url="https://github.com/taketwo/llm-ollama"
license=("Apache-2.0")
depends=("python" "python-llm" "python-ollama" "python-pydantic")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/taketwo/llm-ollama/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
