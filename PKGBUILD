# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=gmpc-plugins
pkgver=0.20.0
pkgrel=2
pkgdesc="official plugins for GMPC"
arch=(i686 x86_64)
url="http://gmpc.wikia.com/"
license="GPL"
depends=('libmpd>=0.19.0' 'gmpc>=0.19.0' 'lirc' 'xosd' 'libwebkit' 'libmicrohttpd' 'taglib')
makedepends=('gob2' 'intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e8c47c7cfeb8aab8995beef45d1c95ce')
options=(!libtool)

build() {
  cd ${startdir}/src
  tar xzf ${pkgname}-${pkgver}.tar.gz 
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
