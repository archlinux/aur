# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
pkgname=sofia-sip
pkgver=1.12.11
pkgrel=3
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
source=(http://downloads.sourceforge.net/sofia-sip/${pkgname}-${pkgver}.tar.gz)
md5sums=('f3582c62080eeecd3fa4cd5d4ccb4225')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
