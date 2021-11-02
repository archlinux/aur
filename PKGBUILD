# Maintainer: Tobias Borgert <tobias.borgertt@gmail.com>

pkgname=fineftp-server
pkgver=1.0.13
pkgrel=1
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('any')
url="https://github.com/continental/fineftp-server"
license=('MIT')
depends=('asio')
makedepends=()
optdepends=()
source=(https://github.com/continental/fineftp-server/archive/v$pkgver.tar.gz)
md5sums=('c1d6db6add56bfe25fb57542982924fe')

build() {
    cd $pkgname-$pkgver
    mkdir -p _build
    cd _build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make

}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd _build
    DESTDIR="$pkgdir" make install
}
