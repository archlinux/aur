# Maintainer: Martchus <martchus@gmx.net>
pkgname=videodownloader
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube is maintained)."
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/videodownloader"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/videodownloader/archive/v${pkgver}.tar.gz")
_reponame=videodownloader
sha256sums=('f974eb133034f40324f33661e0e98e3c4ed8567cc17838d54e2cddc492ba458b')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
