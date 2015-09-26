# Maintainer: Martchus <martchus@gmx.net>
pkgname=tagparser
pkgver=2.0.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="C++ library for reading and writing MP4 (iTunes), ID3, Vorbis and Matroska tags."
license=('GPL')
depends=('c++utilities')
makedepends=('qt5-base')
url="https://github.com/Martchus/tagparser"
source=("tagparser-${pkgver}.tar.gz::https://github.com/Martchus/tagparser/archive/v${pkgver}.tar.gz")
_reponame=tagparser
sha256sums=('7ab448f305692c9185be3916b00d984507e6c28472d4c320229c48994d1c300c')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
