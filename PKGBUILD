# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-runtime-inmem
pkgname=python-$_name
pkgver=0.23.1
pkgrel=1
pkgdesc="Inmem implementation for the LangGraph API server."
arch=('any')
license=('Elastic-2.0')
url="https://pypi.org/project/langgraph-runtime-inmem/"
depends=('python' 'python-blockbuster' 'python-langgraph' 'python-structlog' 'python-sse-starlette' 'python-starlette' 'python-langgraph-checkpoint')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f7854bb2742dd797ae8d19a51d3b72d6218b51cb961af4fe9b437bb50710890b')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
