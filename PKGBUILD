# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=gmpc-plugins
pkgver=0.20.0
pkgrel=4
pkgdesc="official plugins for GMPC"
arch=(i686 x86_64)
url="http://gmpclient.org/"
license="GPL"
depends=('libmpd>=0.19.0' 'gmpc>=0.19.0' 'lirc-utils' 'xosd' 'libwebkit' 'libmicrohttpd' 'taglib')
makedepends=('gob2' 'intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e8c47c7cfeb8aab8995beef45d1c95ce')
options=(!libtool)
changelog=$pkgname.changelog

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/$pkgname-$pkgver
  make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:
