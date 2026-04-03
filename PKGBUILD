# Maintainer:  <clu@eeviac>

pkgname=capasm
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Assembler for the Hewlett Packard Capricorn CPU (Series 80, HP-75)"
arch=('x86_64')
url="https://github.com/bug400/capasm"
license=('GPLV2')
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
PACKAGER="eeviac"
source=(https://github.com/bug400/capasm/archive/refs/tags/v${pkgver}.tar.gz)
sha1sums=('1c4e68533f075e6e6aac17189822e96b75468cbe')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  python -m installer --destdir="$pkgdir" dist/*.whl
}
