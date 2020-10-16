# Maintainer: Tobias Borgert <tobias.borgertt@gmail.com>

pkgname=fineftp-server
pkgver=1.0.5
pkgrel=1
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('any')
url="https://github.com/continental/fineftp-server"
license=('MIT')
depends=('asio')
makedepends=()
optdepends=()
source=(https://github.com/continental/fineftp-server/archive/v$pkgver.tar.gz)
md5sums=('9650433ac836b5a2cb772297735dd679')

build() {
    cd $pkgname-$pkgver
    mkdir -p _build
    cd _build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make

}

package() {
    cd $pkgname-$pkgver
    cd _build
    DESTDIR="$pkgdir" make install
}
