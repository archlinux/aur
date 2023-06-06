pkgname="python-imsim-git"
_pkgname="imsim"
pkgver=3.0
pkgrel=1
pkgdesc="software package that simulates the LSST telescope and survey."
arch=("x86_64")
url='https://github.com/LSSTDESC/imSim'
depends=('python-galsim' 'python-rubinsim-git')
makedepends=(python-build python-installer python-setuptools python-wheel python-setuptools-scm)
license=('BSD')
source=("$pkgname::git+https://github.com/LSSTDESC/imSim.git")
sha256sums=('SKIP')


build() {
  cd ${pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
}


package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}

