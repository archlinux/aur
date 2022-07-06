# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=loginx
pkgver=1.4
pkgrel=1
pkgdesc="Console getty/login/xinit replacement"
arch=('x86_64')
url="https://sourceforge.net/projects/loginx"
license=('ISC')
depends=('pam' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/files/$pkgname-$pkgver.tar.gz/download")
sha256sums=('b11faae3ec0be7922127367974624dc574d8297f1f0e44d276c76f37ea5f46af')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr" --sbindir="/usr/bin"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
