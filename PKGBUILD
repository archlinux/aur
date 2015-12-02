# Maintainer: Martchus <martchus@gmx.net>
_reponame=videodownloader
pkgname=videodownloader
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A video downloader with Qt GUI (currently only YouTube is maintained)."
license=('GPL')
depends=('qtutilities' 'openssl' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('fefa04939c9310474e70b509142f7d7330e1c175d3507a081c58f447a34da347')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
