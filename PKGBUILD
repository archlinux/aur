# Maintainer: Mike Sharov <msharov@users.sourceforge.net>

pkgname=pam_autologin
pkgver=1.2
pkgrel=1
pkgdesc="PAM autologin module"
arch=('x86_64')
url="https://sourceforge.net/projects/pam-autologin"
license=('ISC')
depends=('pam')
source=("$pkgname-$pkgver.tar.gz::$url/files/$pkgname-$pkgver.tar.gz/download")
sha256sums=('6d959b15e25ff5b84c4ea85f864553fbab8f6a5f0713891055fb9d058471885c')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix="/usr"
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
