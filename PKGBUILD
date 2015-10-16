# Maintainer: Martchus <martchus@gmx.net>
pkgname=tagparser
pkgver=3.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="C++ library for reading and writing MP4 (iTunes), ID3, Vorbis and Matroska tags."
license=('GPL')
depends=('c++utilities')
makedepends=('qt5-base')
url="https://github.com/Martchus/tagparser"
source=("tagparser-${pkgver}.tar.gz::https://github.com/Martchus/tagparser/archive/v${pkgver}.tar.gz")
_reponame=tagparser
sha256sums=('2190d5d3c3305554a070082f7e285a5f415865575a7280bb0d628b36030dae87')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
