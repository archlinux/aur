# Maintainer: ReindeerFlotilla <clu@eeviac>

pkgname=python-fitsio
_pkgname=fitsio
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="A python package for FITS input/output wrapping cfitsio"
arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio"
license=('GPL')
groups=()
depends=('python' 'python-numpy')
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/esheldon/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha1sums=('1a43d2324e5f5f909b63ebdc28c83a65c9b78408')
noextract=()


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

