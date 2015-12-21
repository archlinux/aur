# Maintainer: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=srmio
pkgver=0.1.1~git1
pkgrel=1
pkgdesc="library + command line tools to access a \"Schoberer Rad Messtechnik\" PowerControl V, VI and 7 + read/write their files"
arch=('i686' 'x86_64')
url="http://www.zuto.de/project/srmio/"
license=('custom: Rainer Clasen')
makedepends=('gcc' 'make')
depends=()
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.zuto.de/project/files/srmio/srmio-0.1.1~git1.tar.gz)
md5sums=(badca33309f469930e13a7d40ea6eadf)

build() {
  cd "${srcdir}/srmio-$pkgver/"
  ./configure --prefix=/usr/
  make -j8
}

package() {
  cd "${srcdir}/srmio-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
