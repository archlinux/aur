# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ag-ui-protocol
pkgname=python-${_name}
pkgver=0.1.8
pkgrel=1
pkgdesc="Python SDK for the Agent-User Interaction (AG-UI) Protocol."
arch=('any')
license=('MIT')
url="https://github.com/ag-ui-protocol/ag-ui/tree/main/python-sdk"
depends=('python' 'python-pydantic')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('eb745855e9fc30964c77e953890092f8bd7d4bbe6550d6413845428dd0faac0b')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
