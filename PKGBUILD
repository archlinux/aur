# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Martin Harrigan <martinharrigan at gmail.com>
pkgname="python-llm"
_name=${pkgname#python-}
pkgver="0.21"
pkgrel=1
pkgdesc="Access large language models from the command-line"
arch=("any")
url="https://github.com/simonw/llm"
license=("Apache-2.0")
depends=("python" "python-click" "python-httpx" "python-openai" "python-click-default-group" "sqlite-utils" "python-sqlite-migrate" "python-pydantic" "python-pyyaml" "python-pluggy" "python-ulid" "python-puremagic")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
