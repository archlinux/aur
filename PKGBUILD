# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Martin Harrigan <martinharrigan at gmail.com>
pkgname="python-llm"
_name=${pkgname#python-}
pkgver="0.31.1"
pkgrel=1
pkgdesc="Access large language models from the command-line"
arch=("any")
url="https://github.com/simonw/llm"
license=("Apache-2.0")
depends=("python" "python-click" "python-openai" "python-click-default-group" "python-condense-json" "sqlite-utils" "python-sqlite-migrate" "python-pydantic" "python-pyyaml" "python-pluggy" "python-ulid" "python-puremagic" "python-httpx")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c779e062b288e28d741297d16fc27a6fd7b1dbdd6659c4c83558a663c4aa11c9')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
