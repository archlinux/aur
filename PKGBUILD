# Maintainer: Martchus <martchus@gmx.net>
pkgname=videodownloader
pkgver=1.0.8
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube is maintained)."
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/videodownloader"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/videodownloader/archive/v${pkgver}.tar.gz")
_reponame=videodownloader
sha256sums=('3e8a969494be4d90c4d00725dbe16225f12b2fea71c44d9053c70f46716838d3')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
