# Maintainer: Ash <xash at riseup d0t net>
pkgname=python-ptpimg-uploader
pkgver=0.13
pkgrel=1
pkgdesc="Upload image files or URLs to ptpimg.me"
arch=('any')
url="https://github.com/theirix/ptpimg-uploader"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-requests'
)
optdepends=(
  'python-pyperclip: clipboard support (--clip)'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pypi_project="ptpimg-uploader"
_sdist_name="ptpimg_uploader-${pkgver}.tar.gz"

source=("${_sdist_name}::https://files.pythonhosted.org/packages/source/p/${_pypi_project}/${_sdist_name}")
sha256sums=('b2bc87d0fb2b4c8d810fe0d73651db7fd14b9a14b43c88634d6f9aee21705541')

build() {
  cd "${srcdir}/ptpimg_uploader-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/ptpimg_uploader-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}