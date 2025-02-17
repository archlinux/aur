# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pydantic-graph
pkgname=python-${_name}
pkgver=0.0.24
pkgrel=1
pkgdesc='Graph and state machine librarys.'
arch=('any')
url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('40550e2310002f411b1fc0636206222caa5459ede7c44da5c856b3526b3096cd')
depends=('python>=3.9' 'python-httpx' 'python-logfire-api' 'python-pydantic')
makedepends=('python-hatchling')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
