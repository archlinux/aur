# Maintainer: Martchus <martchus@gmx.net>
pkgname=videodownloader
pkgver=1.0.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube is maintained)."
license=('GPL')
depends=('qtutilities' 'openssl')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/videodownloader"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/videodownloader/archive/v${pkgver}.tar.gz")
_reponame=videodownloader
sha256sums=('skip')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
