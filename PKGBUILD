# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-runtime-inmem
pkgname=python-$_name
pkgver=0.15.0
pkgrel=1
pkgdesc="Inmem implementation for the LangGraph API server."
arch=('any')
license=('Elastic-2.0')
url="https://pypi.org/project/langgraph-runtime-inmem/"
depends=('python' 'python-blockbuster' 'python-langgraph' 'python-structlog' 'python-sse-starlette' 'python-starlette' 'python-langgraph-checkpoint')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e5bd37b1942e7d7c816f0591b48d89dcca06197ed3d1733fbb2b9293bbc4cb88')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
