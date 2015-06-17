# Maintainer: M0Rf30

pkgname=libpam-google-authenticator
pkgver=1.0
pkgrel=1
pkgdesc='PAM module for google authenticator app'
arch=('i686' 'x86_64')
url="https://code.google.com/p/google-authenticator/"
license=('Apache')
depends=('pam')
optdepends=('qrencode: scannable QR codes for google auth phone app')
conflicts=('google-authenticator-libpam-git' 'google-authenticator-libpam-hg')
source=("http://google-authenticator.googlecode.com/files/${pkgname}-${pkgver}-source.tar.bz2")
install=${pkgname}.install

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 pam_google_authenticator.so "$pkgdir/usr/lib/security/pam_google_authenticator.so"
  install -D -m755 google-authenticator "$pkgdir/usr/bin/google-authenticator"
}

md5sums=('9db0194fcae26a67dcedbcd49397e95e')
