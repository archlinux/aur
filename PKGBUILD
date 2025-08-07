# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=tabled

pkgname=python-${_name}
pkgver=0.1.25
pkgrel=1
pkgdesc="A (key-value) data-object-layer to get (pandas) tables from a variety of sources with ease"
arch=('any')
url="https://github.com/i2mint/${_name}"
license=('Apache-2.0')
depends=(python python-pandas python-dol python-i2 python-charset-normalizer python-pyarrow python-lxml python-numpy)
makedepends=(python-build python-installer python-setuptools)
source=(${_name}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('3097c757adeefaefc243237c70b9051a28dba16099580ccf909362ba0b599f28d8fe54c29ef7a559f130393645fd1014b226da73d7e3df67c74eb51cf4647295')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
