# Maintainer: 0fflineuser <0fflineuser@cock.li>
#
# Improvements are welcome, I don't know much about python and it's packaging systems
#

pkgname="python-pdftext"
_name="pdftext"
pkgver=0.6.0
pkgrel=1
pkgdesc="Extract structured text from pdfs quickly"
arch=('any')
url="https://pypi.org/project/pdftext/"
license=('GPL3')
provides=(pdftext)
depends=(python-pydantic python-pydantic-settings)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('0de0a4a5a448cdf28aea30706b3b79013aa8e679488e4d7a57cf69407ab9fb46')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
