# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname=python-tabula
pkgver=2.10.0
pkgrel=1
pkgdesc='Simple wrapper for tabula, read tables from PDF into DataFrame'
url="https://github.com/chezou/tabula-py"
license=('MIT')
arch=('any')
provides=('python-tabula')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('java-runtime' 'python' 'python-pandas' 'python-requests' 'python-numpy')
_name="tabula_py"
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('1c952a775933c6acca75a2de5f66d7f9ca0de8844058df6799e19036cb4b93365e6945a4cef70282c99fe153898ab2f297dc3ab988a237ed5a3ece10d4e1f7c7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
