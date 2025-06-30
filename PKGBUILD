_pypi_name=aider_install
pkgname=aider-install
pkgver=0.2.0
pkgrel=1
pkgdesc="A streamlined installer for the Aider AI coding assistant"
arch=('any')
url="https://github.com/Aider-AI/aider"
license=('Apache-2.0')
depends=('python' 'python-uv')
makedepends=('python-build' 'python-installer')
source=("https://pypi.python.org/packages/source/a/aider_install/${_pypi_name}-${pkgver}.tar.gz")
sha256sums=('ee09b95de51ae835a2087fd6c7d0b0bea6a761fb11160a66417331aff777ac09')

build() {
  cd "${_pypi_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pypi_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
