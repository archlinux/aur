# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-community
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.4.2
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
arch=('any')
url="https://github.com/langchain-ai/langchain/blob/master/libs/community"
license=('MIT')
depends=(python-aiohttp python-httpx-sse python-langchain-classic python-langchain-core python-langsmith python-numpy python-pydantic-settings python-requests python-sqlalchemy python-tenacity python-yaml)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('263d2f35acc353411cf9bce15872a353ea45afc33c59016177d60dff538b76bc3914632d1ac363849c8687fb931e5cbaf88c48b3a14b1b223b2e1f2e3ad3eec3')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
