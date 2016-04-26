# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=tagparser
pkgname=tagparser
pkgver=5.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus and Matroska tags."
license=('GPL')
depends=('c++utilities' 'zlib')
makedepends=('cmake')
url="https://github.com/Martchus/${_reponame}"
source=("tagparser-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('a622711f62f99e18aea15bfa3bfdd31dd200eac504b82a891a0a5b8d725dc7c6')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
