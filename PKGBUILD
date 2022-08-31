# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl-ntlm
_pkgname=gsasl
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms - NTLM support"
arch=('x86_64')
url="https://josefsson.org/gsasl/"
license=('GPL')
depends=('gnutls' 'libidn' 'krb5' 'libgcrypt' 'libntlm')
provides=('gsasl')
conflicts=('gsasl')
source=(https://ftp.gnu.org/gnu/gsasl/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('b7c4e3dfdaa50eaba38f3c0914dedb4bc689d1226fcf162e5bfb3942fa6ce1e96405715a747adca78150709f34830f699e9f995f04ce586cd3d0c14b275910e6')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gssapi-impl=mit --enable-ntlm
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
