# Maintainer: Marcin Kornat <marcin.kornat@gmail.com>

pkgname=notesh
_pkgname=Notesh
pkgver=0.4
pkgrel=1
pkgdesc='NoteSH fully functional sticky notes App in your Terminal!'
url='https://github.com/Cvaniak/NoteSH'
arch=('any')
license=('MIT')
depends=(python-tomli python-textual)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/47/b7/c51fd06a364ee7e8d0f222f4745569c2e8012412e492b1d4907c3c494db9/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('74b5cadb5f11e7823b10cd7f5b3a2749adb64c773268039ed41f4cdcbd82a28d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
