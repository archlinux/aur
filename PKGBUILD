# Maintainer: Iago Arantes <iago.arantes1727@gmail.com>
pkgname=tic-tac-toe-c
pkgver=0.0.2
pkgrel=1
pkgdesc="Terminal-based Tic Tac Toe game in C with WASD/arrow key controls"
arch=('x86_64')
url="https://github.com/iaguinho1727/tic-tac-toe-c"
license=('Apache-2.0')
depends=('glibc')
makedepends=('gcc' 'autoconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cbd4b3cb8fa3a26725129854960af4702848345b62228ecc1cb8216b9879572a')

build() {
    cd "$pkgname-$pkgver"
    autoconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
