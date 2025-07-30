# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-runtime-inmem
pkgname=python-${_name}
pkgver=0.6.5
pkgrel=1
pkgdesc="Inmem implementation for the LangGraph API server."
arch=('any')
license=('Elastic-2.0')
url="https://pypi.org/project/langgraph-runtime-inmem/"
depends=('python' 'python-blockbuster' 'python-langgraph' 'python-structlog' 'python-sse-starlette' 'python-starlette' 'python-langgraph-checkpoint')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('ce59aa2d9bdb66d680989f174e7638988b59c3b0e70927c071777e69b59d9c50')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
