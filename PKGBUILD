# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=firecrawl-py
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.13.5
pkgrel=1
pkgdesc="Python SDK for Firecrawl API"
arch=('any')
url="https://github.com/mendableai/firecrawl"
license=('AGPL-3.0-or-later')
depends=(python-dotenv python-nest-asyncio python-pydantic python-requests python-websockets)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('dd57d5270801222fcdeb019ac7a35dfef16f9a8eb19de446a9666b008473a6c2')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
