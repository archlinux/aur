# Maintainer: Sandy Carter <bwrsandman+aur@gmail.com>

pkgname=fuzzylite
pkgver=6.0
pkgrel=1
pkgdesc="A Fuzzy Logic Control Library in C++"
arch=('i686' 'x86_64')
url="https://www.fuzzylite.com"
license=('GPL3')
depends=()
makedepends=('cmake' 'git')
optdepends=()
provides=()
conflicts=()
source=("https://github.com/fuzzylite/fuzzylite/archive/v${pkgver}.tar.gz")
sha256sums=('7e9f56deb9baf063de2232bfd8285f57ddccb651dae842fe3f587d0ac65ecdb0')

build() {
  cd "${srcdir}/${pkgname}-6.0/${pkgname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='Release'
  make
}

package() {
  cd "${srcdir}/${pkgname}-6.0/${pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
