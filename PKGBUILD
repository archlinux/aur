# Maintainer: Bernardo Kuri <aur+python-axidraw-api@bkuri.com>
# Contributor: Arch Linux Community <arch-dev-public@archlinux.org>

arch=('any')
depends=(python-build python-installer python-wheel)
license=('MIT')
makedepends=(python)
pkgdesc='AxiDraw Python API unofficial installer'
pkgname=python-axidraw-api
pkgrel=1
pkgver=394
sha256sums=('b4f52caca5e88e3129518db2853c0974410996b999f1a831c12266f8bee34141')
url='https://axidraw.com/doc/py_api'

id="AxiDraw_API_$pkgver"
source=("$id.zip::https://cdn.evilmadscientist.com/dl/ad/public/${id%_$pkgver}.zip")

build() {
  cd "$id"
  python -m build --wheel --no-isolation
}

package() {
  cd "$id"
  python -m installer --destdir="$pkgdir" dist/*.whl
}