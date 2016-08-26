# Maintainer: M0Rf30

pkgname=libpam-google-authenticator
pkgver=1.01
pkgrel=1
pkgdesc='PAM module for google authenticator app'
arch=('i686' 'x86_64')
url="https://github.com/google/google-authenticator"
license=('Apache')
depends=('pam')
optdepends=('qrencode: scannable QR codes for google auth phone app')
conflicts=('google-authenticator-libpam-git' 'google-authenticator-libpam-hg')
source=("https://github.com/google/google-authenticator/archive/master.zip")
install=${pkgname}.install

build() {
  cd $srcdir/${pkgname#libpam-}-master
  cd libpam
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname#libpam-}-master
  cd libpam
  make DESTDIR=$pkgdir install
}

md5sums=('SKIP')
