# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-lvis
_pkgname=lvis
pkgver=0.5.3
pkgrel=1
pkgdesc='Python API for LVIS Dataset'
arch=('any')
url='https://github.com/lvis-dataset/lvis-api'
license=(BSD)
depends=(
  opencv
  python-cycler
  python-dateutil
  python-kiwisolver
  python-matplotlib
  python-numpy
  python-pyparsing
  python-pycocotools
  python-six
)
makedepends=(
  git
  cython
  python-pip
  python-setuptools
)
checkdepends=(
  hdf5
  qt5-base
)

source=("${_pkgname}::git+https://github.com/lvis-dataset/lvis-api.git")
sha512sums=('SKIP')

build() {
  cd "${_pkgname}"
  python setup.py build
}

check() {
  cd "${_pkgname}"
  python test.py
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
