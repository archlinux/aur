# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pdftext"
_name="pdftext"
pkgver=0.6.3
pkgrel=3
pkgdesc="Extract structured text from pdfs quickly"
arch=('any')
url="https://pypi.org/project/pdftext/"
license=('Apache 2.0')
provides=(python-pdftext)
depends=(
  python-pydantic python-pydantic-settings
  # AUR dependencies
  python-pypdfium2
)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('ab5c5dfe0f1fb78de1db837ccadac1ea41b07ce1890fead973c9a84cdaf54dec')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
