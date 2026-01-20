# Maintainer: Zen Wen <zen.8841@gmail.com>
pkgname=python-scopefoundry
_pkgname=ScopeFoundry
pkgver=2.2.1
pkgrel=1
pkgdesc="A Python platform for controlling custom laboratory experiments and visualizing scientific data"
arch=(any)
url="https://scopefoundry.org/"
license=('BSD-3-Clause')
depends=('python>=3.8' 'python-qtpy' 'python-numpy>=1.24' 'python-pyqtgraph' 'python-h5py')
makedepends=('python-setuptools')
checkdepends=()
optdepends=('python-qtconsole' 'python-pyqtdarktheme')
provides=()
options=()
changelog=$pkgname.changelog
source=("https://github.com/ScopeFoundry/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d06534ec95e73bb56f14d5d32ad2bc6d237b6f3e6c3fad5f69268485313f3ad1")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
}
