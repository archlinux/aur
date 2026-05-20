# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=loginx
pkgver=1.5
pkgrel=1
pkgdesc="Console getty/login/xinit replacement"
arch=('x86_64')
url="https://sourceforge.net/projects/loginx"
license=('ISC')
depends=('pam' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/files/$pkgname-$pkgver.tar.gz/download")
sha256sums=('fa699469cae83ae639b6b8d6f7a2855993df2603a2fb732709f0f2d21ea4e2b4')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr" --sbindir="/usr/bin"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
