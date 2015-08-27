# Maintainer: Martchus <martchus@gmx.net>
pkgname=passwordmanager
pkgver=2.0.7
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A simple password store using AES-256-CBC encryption via OpenSSL."
license=('GPL')
depends=('qt5-base' 'qtutilities' 'passwordfile' 'openssl' 'libxkbcommon-x11')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/passwordmanager"
source=("passwordmanager-${pkgver}.tar.gz::https://github.com/Martchus/passwordmanager/archive/v${pkgver}.tar.gz")
_reponame=passwordmanager
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
