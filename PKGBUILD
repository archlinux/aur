# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-postgres
pkgname=python-$_name
pkgver=3.0.2
pkgrel=1
pkgdesc="Library with a Postgres implementation of LangGraph checkpoint saver."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres"
depends=('python' 'python-langgraph-checkpoint' 'python-orjson' 'python-psycopg' 'python-psycopg-pool')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('448cb8ec245b6fe10171a0f90e9aa047e24a9d3febba6a914644b0c1323da158')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
