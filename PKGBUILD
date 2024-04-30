# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl-ntlm
_pkgname=gsasl
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms - NTLM support"
arch=('x86_64')
url="https://josefsson.org/gsasl/"
license=('GPL')
depends=('gnutls' 'libidn' 'krb5' 'libgcrypt' 'libntlm')
provides=('gsasl')
conflicts=('gsasl')
source=(https://ftp.gnu.org/gnu/gsasl/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('161b8a315862a79807ba067c5ae840175b0d8ec14806aceafc3f92d571713b94d1b8c1a5b188c47bf94a79b9a1f133065f96b087baa5e7f360ae7fb8336381ab')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gssapi-impl=mit --enable-ntlm
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
