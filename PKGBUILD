# Maintainer: Majorx234 <majorx234@gmail.com>

_pkgname=langchain-postgres
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.0.16
pkgrel=1
pkgdesc="This package contains the LangChain integration with Postgres"
arch=('any')
url="https://github.com/langchain-ai/langchain-postgres"
license=('MIT')
depends=(python-langchain-core python-pytest python-asyncpg python-pgvector python-psycopg python-psycopg-pool python-sqlalchemy python-numpy)
makedepends=('python-build' 'python-installer' 'python-pytest' 'python-wheel' 'python-hatchling' 'ruff' 'mypy')
_tag=c97cff5b398145ad504469da7e3c48d018e6fd41
#source=("${_pkgname}-${pkgver}::git+https://github.com/langchain-ai/langchain-postgres.git#${_tag}")
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('fd4fd4182f91d4e6ba6cc37788dd0e5f559dc9f4682d7b0f97ffcbb891d361e633a6d15f6dce8431a3563b9879f5e4479fe8456b5889994a2678ead5c1f2b4d0')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
