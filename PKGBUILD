# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=sgsearch
pkgver=1.2.3
pkgrel=1
pkgdesc="SGSearch is a frontend to the find and grep commands allowing respectively to search for file names or file content. It is meant to be a companion to file managers like Thunar (extension is provided) and works over GVFS."
url="https://sgsearch.tuxfamily.org/"
arch=('x86_64' 'i686')
license=('Other')
depends=('gtk3' 'atk' 'thunar')
optdepends=()
makedepends=(gcc cmake make imagemagick)
conflicts=()
replaces=()
backup=()
install=
source=("https://download.tuxfamily.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('e761a9833af0892fd44eefc376c399d3a589a5b12e3cf694e28d78c8162b6afa')

build() {
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr/" ./
  make
  }

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
