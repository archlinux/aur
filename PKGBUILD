# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=pam_autologin
pkgver=1.0
pkgrel=1
pkgdesc="PAM autologin module"
arch=('x86_64')
url="https://github.com/msharov/pam_autologin"
license=('ISC')
depends=('pam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce71230407bd754cff800ee90cc7fb7f53b4345ecb2da4dfda9533039b9d0377')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
