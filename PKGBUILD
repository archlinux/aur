# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=pam_autologin
pkgver=1.1
pkgrel=1
pkgdesc="PAM autologin module"
arch=('x86_64')
url="https://github.com/msharov/pam_autologin"
license=('ISC')
depends=('pam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ebc3cfdc06a8319661f40e50fc7574be8be3d4d9d2d219ee1186a4bcb459805')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
