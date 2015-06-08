# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=ssrc
pkgver=1.30
pkgrel=5
pkgdesc="Fast and high quality sampling rate converter"
arch=('i686' 'x86_64')
url="http://shibatch.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=(${url}/download/${pkgname}-${pkgver}.tgz)
md5sums=('a14b3c4f97c52e37e9cfeb65fc61f2bf')

prepare() {
  sed -i '5a#include <string.h>' "$pkgname-$pkgver/ssrc.c"
}

build() {
  export CFLAGS+=" -lm"
  cd "$pkgname-$pkgver"
  make -e
}

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$pkgname-$pkgver"/{ssrc,ssrc_hp} "$pkgdir/usr/bin/"
}
