# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ag-ui-protocol
pkgname=python-${_name}
pkgver=0.1.10
pkgrel=1
pkgdesc="Python SDK for the Agent-User Interaction (AG-UI) Protocol."
arch=('any')
license=('MIT')
url="https://github.com/ag-ui-protocol/ag-ui/tree/main/sdks/python"
depends=('python' 'python-pydantic')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('3213991c6b2eb24bb1a8c362ee270c16705a07a4c5962267a083d0959ed894f4')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
