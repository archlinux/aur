# Maintainer: Your Name <your.email@example.com>

pkgname=gcil
_pyname=gitlabci-local
pkgver=13.0.1
pkgrel=1
pkgdesc="Launch .gitlab-ci.yml jobs locally"
arch=('any')
url="https://gitlab.com/RadianDevCore/tools/gcil"
license=('Apache-2.0')
depends=(
  'python>=3.8'
<<<<<<< HEAD
  'python-colored'  # AUR package required
=======
  'python-colored'
>>>>>>> 4c207d6 (Initial import: gcil 13.0.1)
  'python-docker'
  'python-importlib-metadata'
  'python-packaging'
  'python-prompt_toolkit'
  'python-dotenv'
  'python-yaml'
<<<<<<< HEAD
  'python-questionary'  # AUR package required
=======
  'python-questionary'
>>>>>>> 4c207d6 (Initial import: gcil 13.0.1)
  'python-requests'
  'python-setuptools'
  'python-update-checker'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools-scm'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname//-/_}-${pkgver}.tar.gz")
sha256sums=('26a58a01e2b56cbff9c201c6e9f58ae09322fa3db8fd4a624f25fd7a7fcd8ac3')

build() {
  cd "${_pyname//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
