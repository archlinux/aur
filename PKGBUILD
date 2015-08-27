# Maintainer: Martchus <martchus@gmx.net>
pkgname=tagparser
pkgver=2.0.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Library for reading and editing meta-data of several media formats."
license=('GPL')
depends=('c++utilities')
makedepends=('qt5-base')
url="https://github.com/Martchus/tagparser"
source=("tagparser-${pkgver}.tar.gz::https://github.com/Martchus/tagparser/archive/v${pkgver}.tar.gz")
_reponame=tagparser
sha256sums=('037764353c5ea2f837ef8b84079fab2d1073b714372044a0e9a00b03fd27d872')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
