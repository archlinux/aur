# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-postgres
pkgname=python-$_name
pkgver=3.0.3
pkgrel=1
pkgdesc="Library with a Postgres implementation of LangGraph checkpoint saver."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres"
depends=('python' 'python-langgraph-checkpoint' 'python-orjson' 'python-psycopg' 'python-psycopg-pool')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f77852340198b9e71f2d52da5b591cfc55a4a2e537001868a83b9ab1865f9146')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
