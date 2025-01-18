# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-file-tree
_name=file_tree
pkgver=1.6.0
pkgrel=1
pkgdesc="Framework to represent structured directories in python as FileTree objects. It can also be used to visualise the data in structured directories using fsleyes."
arch=('any')
url="https://pypi.org/project/file-tree/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('d36dd6e0a4f2074014180f4a60ff091e10eebe0255f0bc2b855a039ebfec71df')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
