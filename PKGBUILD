# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl-ntlm
_pkgname=gsasl
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms - NTLM support"
arch=('x86_64')
url="https://josefsson.org/gsasl/"
license=('GPL')
depends=('gnutls' 'libidn' 'krb5' 'libgcrypt' 'libntlm')
provides=('gsasl')
conflicts=('gsasl')
source=(https://ftp.gnu.org/gnu/gsasl/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('0ae318a8616fe675e9718a3f04f33731034f9a7ba03d83ccb1a72954ded54ced35dc7c7e173fdcb6fa0f0813f8891c6cbcedf8bf70b37d00b8ec512eb9f07f5f')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gssapi-impl=mit --enable-ntlm
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
