# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-runtime-inmem
pkgname=python-${_name}
pkgver=0.6.3
pkgrel=1
pkgdesc="Inmem implementation for the LangGraph API server."
arch=('any')
license=('Elastic-2.0')
url="https://pypi.org/project/langgraph-runtime-inmem/"
depends=('python' 'python-blockbuster' 'python-langgraph' 'python-structlog' 'python-sse-starlette' 'python-starlette' 'python-langgraph-checkpoint')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('b60f93aea9f390d6f0a9ccaee82d805f9ecebae78a0d98296ea8d67da1200c96')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
