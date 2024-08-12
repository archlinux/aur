# Maintainer:  <clu@eeviac>

pkgname=ophis
_pkgname=Ophis
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="An assembler for the 6502 microprocessor"
arch=('i686' 'x86_64')
url="http://michaelcmartin.github.io/Ophis/"
license=('MIT')
groups=()
depends=('python')
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
source=(https://github.com/michaelcmartin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha1sums=('ced176c3e237f4f774d04b2d8d59eefbd2c87ea9')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python -m installer --destdir="$pkgdir" dist/*.whl
}
