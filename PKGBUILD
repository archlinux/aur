# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=sgsearch
pkgver=1.2.4
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

sha256sums=('2edc55530080a782013cdb0eb8c006a35205b2ad59f979df7ace7c54d3c07f6b')

build() {
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr/" ./
  make
  }

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
