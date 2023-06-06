pkgname="python-rubinsim-git"
_pkgname="rubin_sim"
pkgver=1.1.0
pkgrel=1
pkgdesc="Scheduler, survey strategy analysis, and other simulation tools for Rubin Observatory."
arch=("x86_64")
url='https://github.com/lsst/rubin_sim'
depends=()
makedepends=(python-build python-installer python-setuptools python-wheel python-setuptools-scm)
license=('GPL3')
source=("$pkgname::git+https://github.com/lsst/${_pkgname}.git")
sha256sums=('SKIP')


build() {
  cd ${pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
}


package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}

