# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=loginx
pkgver=1.3
pkgrel=1
pkgdesc="Console getty/login/xinit replacement"
arch=('x86_64')
url="https://github.com/msharov/loginx"
license=('ISC')
depends=('pam' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8fae575a1312690b17ded7892bda94560e454110f4e500feeac77b98f960a12c')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr" --sbindir="/usr/bin"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
