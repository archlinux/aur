# Maintainer: Martchus <martchus@gmx.net>
_reponame=tagparser
pkgname=tagparser
pkgver=4.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="C++ library for reading and writing MP4 (iTunes), ID3, Vorbis and Matroska tags."
license=('GPL')
depends=('c++utilities' 'zlib')
makedepends=('cmake')
url="https://github.com/Martchus/${_reponame}"
source=("tagparser-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('db5789f24262c4adfcf9c9fa3f237fab0abb3717065e674c2f1ada96bfe0ed95')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}
