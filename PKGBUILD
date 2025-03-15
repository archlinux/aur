# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pdftext"
_name="pdftext"
pkgver=0.6.2
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
sha256sums=('ff5b92462ac03ae63a23429384ae123d45c162dcda30e7bf2c5c92a6b208c9de')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
