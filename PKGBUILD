# Maintainer: M0Rf30

pkgname=libpam-google-authenticator
pkgver=1.03
pkgrel=1
pkgdesc='PAM module for google authenticator app'
arch=('i686' 'x86_64')
url="https://github.com/google/google-authenticator-libpam"
license=('Apache')
depends=('pam')
optdepends=('qrencode: scannable QR codes for google auth phone app')
conflicts=('google-authenticator-libpam-git' 'google-authenticator-libpam-hg')
source=("https://github.com/google/google-authenticator-libpam/archive/${pkgver}.tar.gz")
install=${pkgname}.install

build() {
  cd $srcdir/google-authenticator-libpam-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/google-authenticator-libpam-${pkgver}
  make DESTDIR=$pkgdir install
}

md5sums=('4647e515e6986f6e5b00409c989d4267')
