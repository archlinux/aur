# Maintainer: Martchus <martchus@gmx.net>
_reponame=tageditor
pkgname=tageditor
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4 (iTunes), ID3, Vorbis and Matroska."
license=('GPL')
depends=('qt5-script' 'qt5-webkit' 'qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('6b050fe5281b0be7dba02783e86dfb93c781c8271be949e81371113905db1312')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}
