# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=gmpc-plugins
pkgver=11.8.16
pkgrel=2
pkgdesc="official plugins for GMPC"
arch=(i686 x86_64)
url="http://gmpclient.org/"
license=("GPL")
depends=('libmpd>=0.19.0' 'gmpc>0.20.2' 'libwebkit' 'taglib')
makedepends=('gob2' 'intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('80eb86051a5c1c3932f0fdef36ba7846')
options=(!libtool)

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make CFLAGS="${CFLAGS} -DHAVE_STRNDUP"
}

package(){
  cd ${srcdir}/$pkgname-$pkgver
  make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:
