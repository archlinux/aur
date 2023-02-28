# Maintainer: Marcin Kornat <marcin.kornat@gmail.com>

pkgname=notesh
_pkgname=Notesh
pkgver=0.6
pkgrel=1
pkgdesc='NoteSH fully functional sticky notes App in your Terminal!'
url='https://github.com/Cvaniak/NoteSH'
arch=('any')
license=('MIT')
depends=(python-tomli python-textual)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/n/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5cecd02b1c06e6968428d3d0d0934928be8bdf3038f1ae1d7456c8f83d0bd75e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
