# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=cosmograph

pkgname=python-${_name}
pkgver=0.0.47
pkgrel=1
pkgdesc="Visualize large-scale network graphs and machine learning embeddings"
arch=('any')
url="https://github.com/cosmograph-org/py_cosmograph"
license=('GPL-3.0-or-later')
depends=(python ipython python-anywidget python-pyarrow python-pandas python-numpy python-traitlets python-i2 python-dol python-tabled python-ju)
makedepends=(python-build python-installer python-hatchling python-hatch-jupyter-builder npm)
source=(${_name}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('7e9cd18bc20b5ec19f7628ecc7075ff5432fb01d4e452c3cb1b1c9561a4d137132d55bd0c91209b5451c8494386951016882f5e374fd71a16758a252c42df33c')

build(){
  cd "${srcdir}/py_cosmograph-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/py_cosmograph-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
