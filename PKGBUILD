# Maintainer: alcubierre-drive
_base=fancymaps
pkgname=python-${_base}
pkgver=0.1.22
pkgrel=1
pkgdesc="Colormap collection from various (creative) sources"
url="https://github.com/alcubierre-drive/${_base}"
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
license=(GPLv3)
arch=(any)
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    : nothing
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
