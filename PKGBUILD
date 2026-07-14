# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=pam_autologin
pkgver=1.3
pkgrel=1
pkgdesc="PAM autologin module"
arch=('x86_64')
url="https://sourceforge.net/projects/pam-autologin"
license=('ISC')
depends=('pam')
source=("$pkgname-$pkgver.tar.gz::$url/files/$pkgname-$pkgver.tar.gz/download")
sha256sums=('6f0ff991703d67db32e7271bb9de0b9951e28ee23dc8b85858e00a8fcb77193f')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
